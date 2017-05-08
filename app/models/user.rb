class User < ApplicationRecord
  # Others available devise modules are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :registerable, :rememberable, :trackable
  devise :database_authenticatable, :validatable, :recoverable
  VALID_NAME_REGEX = /\A[a-zA-Z'-]+\z/
  VALID_PHONE_REGEX = /\A[\d\- ]{7,10}\z/
  enum gender: { male: 0, female: 1, other: 2 }
  enum locale: { en: 0, ua: 1 }
  validates :first_name, :last_name,
            length: { maximum: 24 },
            format: { with: VALID_NAME_REGEX },
            presence: true
  validates_inclusion_of :gender, in: genders.keys, allow_nil: true
  validates :phone,
            length: { in: 7..10 },
            format: { with: VALID_PHONE_REGEX },
            allow_nil: true

  def send_reset_info
    set_reset_password_token
    ResetPasswordWorker.perform_async(id)
  end
end
