module V1
  module Attachable
    private

    def attachment_uploader
      SingleAttachmentUploader.new(attachment_params)
    end

    def attachment_params
      params.require(:file).permit(:filetype, :filename, :base64)
    end
  end
end
