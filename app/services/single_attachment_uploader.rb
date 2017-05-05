class SingleAttachmentUploader
  attr_accessor :file

  def initialize(attachment_params)
    decode_base64(attachment_params.symbolize_keys)
  end

  def call(attachment_owner:)
    attachment = Attachment.find_by(attachable: attachment_owner)

    if attachment
      attachment.update_attributes(file: file)
      attachment
    else
      Attachment.create(file: file, attachable: attachment_owner)
    end
  end

  private

  def decode_base64(filename:, filetype:, base64:)
    @file = Paperclip.io_adapters.for("data:#{filetype};base64,#{base64}")
    @file.original_filename = filename
  end
end
