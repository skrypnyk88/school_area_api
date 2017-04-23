class ReportTime < ApplicationRecord
  belongs_to :reportable, polymorphic: true

  validates :start_time, presence: true
  
  def start_time_formated
    start_time.strftime('%H:%M')
  end

  def end_time_formated
    end_time.strftime('%H:%M') if end_time != nil
  end
end
