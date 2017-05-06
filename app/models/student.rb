class Student < ApplicationRecord
  belongs_to :group, optional: true
  has_many :my_day_reports, dependent: :nullify
  has_many :presence_reports, dependent: :nullify
  has_many :bottle_reports, dependent: :nullify

  before_save :titleize_name

  enum gender: { male: 0, female: 1 }

  validate :validate_age

  validates :first_name, :last_name,
            presence: true,
            length: { maximum: 20 },
            format: {
              with: /\A[a-z '-]+\z/i,
              message: proc do
                I18n.t('student_model.errors_of_validation.allows_only_letters')
              end
            }

  validates :birthdate,
            presence: true

  validates :gender,
            allow_nil: true,
            inclusion: {
              in: :gender
            }

  def age
    (Date.today - birthdate).to_i / 365
  end

  def valid_age?
    age.between?(2, 6)
  end

  scope :present, lambda { |day|
    includes(presence_reports: :report_times)
      .where('presence_reports.day' => day)
      .where.not('report_times.start_time' => nil)
  }

  private

  def titleize_name
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end

  def validate_age
    return unless birthdate && !valid_age?
    errors.add(:age, I18n.t('student_model.errors_of_validation.child_age'))
  end
end
