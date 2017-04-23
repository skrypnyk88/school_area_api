class ReportTime < ApplicationRecord
  belongs_to :reportable, polymorphic: true

  validates :start_time, presence: true
end
