require 'rails_helper'

RSpec.describe V1::StudentsController, type: :controller do
  render_views

  def student_params(student)
    params = student.attributes
                    .with_indifferent_access
                    .extract!(:id, :first_name, :last_name, :birthdate, :gender)
                    .merge(age: student.age)

    if student.attachment
      params.merge(url: "http://#{request.host}#{student.attachment.file.url}")
    else
      params
    end
  end

  let(:teacher) { create(:teacher) }

  let(:group) { create(:group) }

  let(:current_user_group) { create(:group_with_students) }

  let(:student) { current_user_group.students.first }

  let(:student_attrs) { attributes_for(:student).with_indifferent_access }

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(teacher)
    teacher.groups << current_user_group
  end

  describe 'GET #index' do
    before do
      create(:group_with_students)
    end

    it 'returns all students' do
      students = current_user_group.students
                                   .map { |s| student_params(s) }
                                   .to_json

      get :index, format: :json,
                  params: { group_id: current_user_group }

      expect(response.body).to eq(students)
    end
  end

  describe 'POST #create' do
    context 'when student is valid' do
      it 'creates student' do
        post :create,
             format: :json,
             params: {
               group_id: current_user_group,
               student: student_attrs
             }

        expect(Student.find_by(student_attrs)).to be_present
      end

      it 'renders student json' do
        student_attrs[:birthdate] = student_attrs[:birthdate].to_s

        post :create,
             format: :json,
             params: {
               group_id: current_user_group,
               student: student_attrs
             }

        expect(JSON.parse(response.body)).to include(student_attrs)
      end
    end

    context 'when student is not valid' do
      let(:invalid_student) { build(:student, first_name: '111') }

      it 'renders errors json' do
        allow(Student).to receive(:new).and_return(invalid_student)

        post :create,
             format: :json,
             params: {
               group_id: current_user_group,
               student: invalid_student.attributes
             }

        expect(response.body)
          .to eq(invalid_student.errors.full_messages.to_json)
      end
    end
  end

  describe 'GET #show' do
    it 'renders student json' do
      get :show, format: :json,
                 params: {
                   group_id: current_user_group,
                   id: student
                 }

      expect(response.body).to eq(student_params(student).to_json)
    end
  end

  describe 'PATCH #update' do
    context 'when student is valid' do
      let(:valid_params) do
        { method: :patch,
          group_id: current_user_group,
          id: student,
          student: { first_name: 'Aaaa' } }
      end

      it 'updates students attributes' do
        post :update, format: :json,
                      params: valid_params

        expect(student.reload.first_name)
          .to eq(valid_params[:student][:first_name])
      end

      it 'renders student json' do
        post :update, format: :json,
                      params: valid_params

        expect(response.body).to eq(student_params(student.reload).to_json)
      end
    end

    context 'when student is not valid' do
      let(:invalid_params) do
        { method: :patch,
          group_id: current_user_group,
          id: student,
          student: { first_name: '111' } }
      end

      let(:update_errors) do
        student.update_attributes(first_name: '111')
        student.errors.full_messages
      end

      it 'renders errors json' do
        post :update,
             format: :json,
             params: invalid_params

        expect(response.body).to eq(update_errors.to_json)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:delete_params) do
      { method: :delete,
        group_id: current_user_group,
        id: student }
    end

    it 'deletes student' do
      post :destroy,
           format: :json,
           params: delete_params

      expect(Student.exists?(student.id)).to be false
    end

    it 'renders ok response' do
      post :destroy,
           format: :json,
           params: delete_params

      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'PUT #upload' do
    let(:valid_attachment) { create(:attachment, attachable: student) }

    let(:invalid_attachment) { build(:attachment, file: nil) }

    let(:params) do
      { method: :put,
        group_id: current_user_group,
        id: student,
        file: {
          filename: '',
          filetype: '',
          base64: ''
        } }
    end

    context 'when attachment is valid' do
      it 'renders student json' do
        allow_any_instance_of(SingleAttachmentUploader)
          .to receive(:call)
          .and_return(valid_attachment)

        post :upload, format: :json, params: params

        expect(response.body).to eq(student_params(student).to_json)
      end
    end

    context 'when attachment is not valid' do
      it 'renders errors json' do
        allow_any_instance_of(SingleAttachmentUploader)
          .to receive(:call)
          .and_return(invalid_attachment)

        post :upload, format: :json,
                      params: params

        expect(response.body)
          .to eq(invalid_attachment.errors.full_messages.to_json)
      end
    end
  end
end
