module V1
  module Attachable
    private

    def attachment_uploader
      SingleAttachmentUploader.new(attachment_params)
    end

    def attachment_params
      params.require(:file).permit(:filetype, :filename, :base64)
    end

    def upload_attachment(owner, rendering_object = owner)
      attachment = attachment_uploader.call(attachment_owner: owner)
      if attachment.valid?
        render owner && rendering_object, status: :created
      else
        render json: { errors: attachment.errors.full_messages },
               status: :bad_request
      end
    end
  end
end
