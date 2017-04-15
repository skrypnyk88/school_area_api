class ReportTime < ApplicationRecord
  belongs_to :reportable, polymorphic: true, dependent: :destroy

  validates :start_time, presence: true
end
