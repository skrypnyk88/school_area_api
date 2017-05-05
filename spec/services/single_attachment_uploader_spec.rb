require 'rails_helper'

RSpec.describe SingleAttachmentUploader do
  let(:object) { create(:user) }

  let(:single_attachment_uploader) do
    file = file_fixture('test.png').open(&:read)

    described_class.new(
      filename: 'test.png',
      filetype: 'image/png',
      base64: Base64.strict_encode64(file)
    )
  end

  describe '#call' do
    context 'when object does not have attachment' do
      it 'creates new attachment' do
        single_attachment_uploader.call(attachment_owner: object)
        expect(Attachment.find_by(attachable: object)).to be_present
      end
    end

    context 'when object has attachment' do
      before do
        create(:attachment)
      end

      it 'does not upload new attachment' do
        single_attachment_uploader.call(attachment_owner: object)
        expect(Attachment.where(attachable: object)).to be_one
      end

      it 'updates attachment' do
        Timecop.freeze(Time.zone.now.change(nsec: 0)) do
          single_attachment_uploader.call(attachment_owner: object)
          expect(Attachment.find_by(attachable: object).file_updated_at)
            .to eq(Time.zone.now)
        end
      end
    end
  end
end
