require 'rails_helper'

RSpec.describe V1::StudentsController, type: :controller do
  render_views

  def student_json(student)
    {
      id: student.id,
      first_name: student.first_name,
      last_name: student.last_name,
      birthdate: student.birthdate,
      age: student.age,
      gender: student.gender
    }.to_json
  end

  before do
    @group = create(:group)
    @student = create(:student, group: @group)
  end

  describe 'GET #index' do
    it 'returns all students' do
      another_student = create(:student, group: @group)

      get :index, format: :json,
                  params: { group_id: @group }

      expect(response.body).to include(student_json(@student))
      expect(response.body).to include(student_json(another_student))
    end
  end

  describe 'POST #create' do
    context 'when student is valid' do
      it 'renders student json' do
        student_attrs = attributes_for(:student).with_indifferent_access
        student_attrs[:birthdate] = student_attrs[:birthdate].to_s

        post :create,
             format: :json,
             params: {
               group_id: @group,
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
               group_id: @group,
               student: attributes_for(:student, first_name: '111')
             }

        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'GET #show' do
    it 'renders student json' do
      get :show, params: { id: @student },
                 format: :json

      expect(response.body).to eq(student_json(@student))
    end
  end

  describe 'PATCH #update' do
    context 'when student is valid' do
      before do
        post :update, format: :json,
                      params: {
                        method: :patch,
                        id: @student,
                        student: { first_name: 'Aaaa' }
                      }
      end

      it 'updates students attributes' do
        expect(@student.reload.first_name).to eq('Aaaa')
      end

      it 'renders student json' do
        expect(response.body).to eq(student_json(@student.reload))
      end
    end

    context 'when student is not valid' do
      it 'renders bad_request response' do
        post :update,
             format: :json,
             params: {
               method: :patch,
               id: @student,
               student: { first_name: '111' }
             }

        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      post :destroy,
           format: :json,
           params: {
             method: :delete,
             id: @student
           }
    end

    it 'deletes student' do
      expect(Student.exists?(@student.id)).to be false
    end

    it 'renders ok response' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
