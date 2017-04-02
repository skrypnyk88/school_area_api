class ReportTime < ApplicationRecord
  validates :start_time, presence: true
end
