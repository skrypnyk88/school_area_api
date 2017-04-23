class Student < ApplicationRecord
  belongs_to :group, optional: true
  has_many :my_day_reports, dependent: :nullify
<<<<<<< 6b426f725b27b5ae5adb7f602876ca02cc82fe0d
<<<<<<< bd094170f2a1e4c4eb2a71d5eaff6e9be248fe61
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
<<<<<<< 16049e24e6c0c43dd3e60d88d2f6c531fa9a75fa
  has_many :presence_reports, dependent: :nullify
<<<<<<< a6a50299efba44f13a3e557fed3e3f3d2bca1ad3
=======
  has_many :presence_reports
  
>>>>>>> LVRUBYM-219: Fixed
=======
  has_many :presence_reports, dependent: :nullify
>>>>>>> LVRUBYM-219: add ReportTimesController
=======
  has_many :presence_reports
  
>>>>>>> LVRUBYM-219: Fixed
=======
  has_many :presence_reports, dependent: :nullify
>>>>>>> LVRUBYM-219: add ReportTimesController
=======
  has_many :bottle_reports, dependent: :nullify
>>>>>>> LVRUBYM-221:Add module and service

  before_save :titleize_name

  enum gender: { male: 0, female: 1 }

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
            allow_nil: true,
            inclusion: {
              in: :gender,
              message: 'should be male or female'
            }

  def age
    (Date.today - birthdate).to_i / 365
  end

  def valid_age?
    age.between?(2, 6)
  end

<<<<<<< 72d59ee036847a4966334687cc75c280e5f58758
  scope :present, lambda { |day|
    includes(presence_reports: :report_times)
      .where('presence_reports.day' => day)
      .where.not('report_times.start_time' => nil)
=======
  scope :present, lambda {
    includes(presence_reports: :report_times)
      .where('report_times.start_time' => DateTime.now.beginning_of_day..
                                          DateTime.now.end_of_day)
>>>>>>> LVRUBYM-219: Fixed controller and tests
  }

  private

  def titleize_name
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end

  def validate_age
    return unless birthdate && !valid_age?
    errors.add(:age, ' should be from 2 to 6')
  end
end
