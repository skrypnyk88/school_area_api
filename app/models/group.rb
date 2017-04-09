class Group < ApplicationRecord
  has_many :students, dependent: :nullify
  has_many :my_day_reports, dependent: :nullify
  has_many :bottle_reports, dependent: :nullify
  has_and_belongs_to_many :teachers, association_foreign_key: 'user_id'
<<<<<<< 9f3e1d86d221652a12f76a032aac88aea240d517
<<<<<<< bd094170f2a1e4c4eb2a71d5eaff6e9be248fe61
  has_many :presence_reports, dependent: :nullify
=======
=======
  has_many :presence_reports, dependent: :nullify
>>>>>>> LVRUBYM-219: Fixed
>>>>>>> LVRUBYM-219: Fixed
=======
  has_many :presence_reports, dependent: :nullify
>>>>>>> LVRUBYM-221:Added associations to group and student; Changed controllers and added tests for it

  before_save :capitalize_name

  validates :name,
            presence: true,
            length: { maximum: 20 },
            format: {
              with: /\A[a-z0-9 -]+\z/i,
              message: 'allows only letters or numbers'
            }

  private

  def capitalize_name
    self.name = name.capitalize
  end
end
