require 'rails_helper'

RSpec.describe V1::TeachersController, type: :controller do
  render_views

  def teacher_params(teacher)
    url = "http://#{request.host}#{teacher.attachment.file.url}"
    params =
      teacher.attributes.with_indifferent_access
             .extract!(:id, :first_name, :last_name, :email, :phone, :locale)

    teacher.attachment ? params.merge(url: url) : params.merge(url: nil)
  end

  let(:current_user) { create(:teacher) }

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  describe 'PATCH #update' do
    let(:valid_attachment) { create(:attachment, attachable: teacher) }
    context 'when teacher is valid' do
      let(:valid_params) do
        { method: :patch,
          id: current_user,
          teacher: { locale: 'ua' },
          file: {
            filename: '',
            filetype: '',
            base64: ''
          } }
      end

      it 'updates teacher attributes' do
        post :update, format: :json,
                      params: valid_params

        expect(current_user.reload.locale)
          .to eq(valid_params[:teacher][:locale])
      end
    end
  end

  describe 'PUT #upload' do
    let(:valid_attachment) { create(:attachment, attachable: current_user) }

    let(:invalid_attachment) { build(:attachment, file: nil) }

    let(:params) do
      { id: current_user,
        file: {
          filename: '',
          filetype: '',
          base64: ''
        } }
    end

    context 'when attachment is valid' do
      it 'renders teacher json' do
        allow_any_instance_of(SingleAttachmentUploader)
          .to receive(:call)
          .and_return(valid_attachment)

        post :upload, format: :json, params: params

        expect(response.body).to eq(teacher_params(current_user).to_json)
      end
    end

    context 'when attachment is not valid' do
      it 'renders errors json' do
        allow_any_instance_of(SingleAttachmentUploader)
          .to receive(:call)
          .and_return(invalid_attachment)

        post :upload, format: :json, params: params

        expect(response.body)
          .to eq({ errors: invalid_attachment.errors.full_messages }.to_json)
      end
    end
  end
end
