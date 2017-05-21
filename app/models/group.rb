class Group < ApplicationRecord
  has_many :students, dependent: :nullify
  has_many :my_day_reports, dependent: :nullify
  has_and_belongs_to_many :teachers, association_foreign_key: 'user_id'
  has_many :presence_reports, dependent: :nullify
  has_many :bottle_reports, dependent: :nullify
  has_many :health_reports, dependent: :nullify
  has_many :nap_reports, dependent: :nullify

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
