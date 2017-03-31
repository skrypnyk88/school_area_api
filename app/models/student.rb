class Student < ApplicationRecord
  before_save :titleize_name

  enum gender: [:male, :female, :other]

  validate :validate_age

  validates :first_name, :last_name,
            presence: true,
            length: { maximum: 20 },
            format: {
              with: /\A[a-z '-]+\z/i,
              message: 'allows only letters'
            }

  validates :birthdate,
            presence: true

  validates :gender,
            inclusion: {
              in: :gender,
              message: 'should be male, female or other'
            }

  private

  def titleize_name
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end

  def validate_age
    age = (Date.today - birthdate).to_i / 365
    errors.add(:age, 'should be from 2 to 6') unless age.between?(2, 6)
  end
end
