require 'rails_helper'

RSpec.describe V1::StudentsController, type: :controller do
  render_views

  let(:post_valid_student) do
    post :create,
         format: :json,
         params: { student: attributes_for(:student) }
  end

  let(:post_invalid_student) do
    post :create,
         format: :json,
         params: { student: attributes_for(:student, first_name: '111') }
  end

  let(:update_valid_student) do
    post :update,
         format: :json,
         params: {
          method: :patch,
          id: @student,
          student: { first_name: 'Aaaa' }
         }
  end

  let(:update_invalid_student) do
    post :update,
         format: :json,
         params: {
          method: :patch,
          id: @student,
          student: { first_name: '111' }
         }
  end

  let(:delete_student) do
    post :destroy,
         format: :json,
         params: {
          method: :delete,
          id: @student
         }
  end

  before do
    @student = create(:student)
  end

  describe 'GET #index' do
    it 'returns all students' do
      another_student = create(:student)

      get :index, format: :json
      json = JSON.parse(response.body)

      expect(json.any? { |hash| hash['id'] ==  @student.id }).to be true
      expect(json.any? { |hash| hash['id'] ==  another_student.id }).to be true
    end
  end

  describe 'POST #create' do
    context 'when student is valid' do
      it 'renders student json' do
        post_valid_student
        json = JSON.parse(response.body)
        expect(json['id']).to eq(Student.last.id)
      end
    end

    context 'when student is not valid' do
      it 'renders bad_request response' do
        post_invalid_student
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'GET #show' do
    it 'renders student json' do
      get :show, params: { id: @student },
                 format: :json

      json = JSON.parse(response.body)

      expect(json['id']).to eq(@student.id)
    end
  end

  describe 'PATCH #update' do
    context 'when student is valid' do
      it 'updates students attributes' do
        update_valid_student
        expect(@student.reload.first_name).to eq('Aaaa')
      end

      it 'renders student json' do
        update_valid_student
        json = JSON.parse(response.body)
        expect(json['id']).to eq(@student.id)
      end
    end

    context 'when student is not valid' do
      it 'renders bad_request response' do
        update_invalid_student
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes student' do
      delete_student
      expect(Student.exists?(@student)).to be false
    end

    it 'renders ok response' do
      delete_student
      expect(response).to have_http_status(:ok)
    end
  end
end
