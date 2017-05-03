require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#first_name' do
    context 'when length <= 24' do
      it 'is valid' do
        expect(build(:user, first_name: 'Julia')).to be_valid
      end
    end
    context 'when length > 24' do
      it 'is not valid' do
        expect(build(:user, first_name: 'a' * 25))
          .to_not be_valid
      end
    end
    context 'when includes not only letters' do
      it 'is not valid' do
        expect(build(:user, first_name: 'Julia:)')).to_not be_valid
      end
    end
  end

  describe '#last_name' do
    context 'when length <= 24' do
      it 'is valid' do
        expect(build(:user, last_name: "O'Nell")).to be_valid
      end
    end
    context 'when length > 24' do
      it 'is not valid' do
        expect(build(:user, last_name: 'Ottovordemgentschenfeldelon'))
          .to_not be_valid
      end
    end
    context 'when includes not only letters' do
      it 'is not valid' do
        expect(build(:user, last_name: 'Shtohryn(Ilkiv)')).to_not be_valid
      end
    end
  end

  describe '#gender' do
    context "when is from 'male', 'female', 'other'" do
      it 'is valid' do
        expect(build(:user, gender: :male)).to be_valid
      end
    end
  end

  describe '#phone' do
    context 'when length <= 10' do
      it 'is valid' do
        expect(build(:user, phone: '0673410777')).to be_valid
      end
    end
    context 'when length >=7' do
      it 'is valid' do
        expect(build(:user, phone: '4456765')).to be_valid
      end
    end
    context 'when length > 10' do
      it 'is not valid' do
        expect(build(:user, phone: '0673410777555554443'))
          .to_not be_valid
      end
    end
    context 'when length < 7' do
      it 'is not valid' do
        expect(build(:user, phone: '16734')).to_not be_valid
      end
    end
    context 'when includes not only digits' do
      it 'is not valid' do
        expect(build(:user, phone: 'm673410711')).to_not be_valid
      end
    end
  end

  describe '#locale' do
    context "when is 'en', 'ua'" do
      it 'is valid' do
        expect(build(:user, locale: :en)).to be_valid
      end
    end
  end

  describe '#send_reset_info' do
    let(:reset_token) { create(:user).send(:set_reset_password_token) }

    it 'generates reset password token' do
      expect(:reset_token).to_not be_nil
    end

    it 'makes a job send reset password instruction email' do
      user = create(:user)

      expect(ResetPasswordWorker).to receive(:perform_async).with(user.id)
      user.send_reset_info
    end
  end

  describe '#reset_pass' do
    let!(:user) { create(:user) }
    let(:params) do
      {
        'password' => '7654321',
        'password_confirmation' => '7654321'
      }
    end

    context 'when reset_password_token is valid' do
      it 'resets password' do
        user.send(:set_reset_password_token)
        expect(user).to receive(:reset_password)
        user.reset_pass(params)
      end
    end
    context 'when reset_password_token is not valid' do
      it "doesn't reset password" do
        user.send(:set_reset_password_token)
        Timecop.freeze(Date.today + 7) do
          expect(user).not_to receive(:reset_password)
          user.reset_pass(params)
        end
      end
    end
  end
end
