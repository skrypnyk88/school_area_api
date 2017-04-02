require 'rails_helper'

RSpec.describe PresenceReport, type: :model do
<<<<<<< b65e4a29b844cb164727aae68d6b9ad169158d53
  describe '#day' do
    context 'when empty' do
      it 'is invalid' do
        expect(build(:presence_report, day: nil)).to_not be_valid
      end
    end

    context 'when not empty' do
      it 'is valid' do
        expect(build(:presence_report, day: '2017-01-11')).to be_valid
      end
    end

    context 'when incorrect order' do
      it 'is invalid' do
        expect(build(:presence_report, day: '20 2017 April')).to_not be_valid
      end
    end
  end
=======
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> LVRUBYM-203: ReportTime model creation
end
