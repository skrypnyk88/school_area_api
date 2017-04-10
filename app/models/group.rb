class Group < ApplicationRecord
  has_many :students, dependent: :nullify
  has_many :our_day, dependent: :nullify
  has_many :my_day_reports, dependent: :nullify

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
