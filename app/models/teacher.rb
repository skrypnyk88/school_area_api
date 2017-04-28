class Teacher < User
  has_and_belongs_to_many :groups, foreign_key: 'user_id'
  VALID_NAME_REGEX = /\A[a-zA-Z'-]+\z/
  VALID_PHONE_REGEX = /\A[\d\- ]{7,10}\z/
  enum gender: { male: 0, female: 1, other: 2 }
  validates :first_name, :last_name,
            length: { maximum: 24 },
            format: { with: VALID_NAME_REGEX, message: 'use only letters' },
            presence: true
  validates_inclusion_of :gender, in: genders.keys, allow_nil: true
  validates :phone,
            length: { in: 7..10 },
            format: { with: VALID_PHONE_REGEX, message: 'use only digits' },
            allow_nil: true
  enum locale: { en: 0, ua: 1 }
end
