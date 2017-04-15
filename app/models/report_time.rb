class ReportTime < ApplicationRecord
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
  belongs_to :reportable, polymorphic: true
=======
  belongs_to :reportable, polymorphic: true, dependent: :destroy
>>>>>>> LVRUBYM-219: add ReportTimesController

  validates :start_time, presence: true

  def start_time_formated
    start_time.strftime('%H:%M')
  end

  def end_time_formated
    end_time.strftime('%H:%M') unless end_time.nil?
  end
end
