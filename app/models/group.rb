class Group < ApplicationRecord
  has_many :students, dependent: :nullify
  has_many :my_day_reports, dependent: :nullify
<<<<<<< f3cd07dc01a5a686c97baac198998b3223720833
  has_and_belongs_to_many :teachers, association_foreign_key: 'user_id'
=======
  has_many :presence_reports, dependent: :nullify
>>>>>>> LVRUBYM-219: Fixed

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
