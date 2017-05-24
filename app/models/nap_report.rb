class NapReport < ApplicationRecord
  belongs_to :student
  belongs_to :group
  has_many :report_times, as: :reportable

  validates :day, presence: true
end
