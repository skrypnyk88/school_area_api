require 'rails_helper'

RSpec.describe V1::StudentsController, type: :controller do
  render_views

  def student_params(student)
    student.attributes
           .with_indifferent_access
           .extract!(:id, :first_name, :last_name, :birthdate, :gender)
           .update(age: student.age)
  end

  let(:group) { create(:group) }

  let(:student) { create(:student, group: group) }

  let(:student_attrs) { attributes_for(:student).with_indifferent_access }

  let(:group_with_students) do
    3.times do
      create(:student, group: group)
    end
    group
  end

  describe 'GET #index' do
    it 'returns all students' do
      students = group_with_students.students
                                    .map { |s| student_params(s) }
                                    .to_json

      get :index, format: :json,
                  params: { group_id: group_with_students }

      expect(response.body).to eq(students)
    end
  end

  describe 'POST #create' do
    context 'when student is valid' do
      it 'creates student' do
        post :create,
             format: :json,
             params: {
               group_id: group,
               student: student_attrs
             }

        expect(Student.find_by(student_attrs)).to be_present
      end

      it 'renders student json' do
        student_attrs[:birthdate] = student_attrs[:birthdate].to_s

        post :create,
             format: :json,
             params: {
               group_id: group,
               student: student_attrs
             }

        expect(JSON.parse(response.body)).to include(student_attrs)
      end
    end

    context 'when student is not valid' do
      it 'renders bad_request response' do
        post :create,
             format: :json,
             params: {
               group_id: group,
               student: attributes_for(:student, first_name: '111')
             }

        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'GET #show' do
    it 'renders student json' do
      get :show, params: { id: student },
                 format: :json

      expect(response.body).to eq(student_params(student).to_json)
    end
  end

  describe 'PATCH #update' do
    context 'when student is valid' do
      let(:valid_params) do
        { method: :patch,
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
          id: student,
          student: { first_name: '111' } }
      end

      it 'renders bad_request response' do
        post :update,
             format: :json,
             params: invalid_params

        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:delete_params) { { method: :delete, id: student } }

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
end
