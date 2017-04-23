class ReportTime < ApplicationRecord
<<<<<<< beb61cd08c7579e6cfe7ba570ddf37a33be33390
  belongs_to :reportable, polymorphic: true
=======
  belongs_to :reportable, polymorphic: true, dependent: :destroy
>>>>>>> LVRUBYM-219: add ReportTimesController

  validates :start_time, presence: true
<<<<<<< 48bf061c9e2c32a48fdffd185f80ffa2dc468c4c

=======
  
>>>>>>> LVRUBYM-191: rebase master branch
  def start_time_formated
    start_time.strftime('%H:%M')
  end

  def end_time_formated
<<<<<<< 48bf061c9e2c32a48fdffd185f80ffa2dc468c4c
    end_time.strftime('%H:%M') unless end_time.nil?
=======
    end_time.strftime('%H:%M') if end_time != nil
>>>>>>> LVRUBYM-191: rebase master branch
  end
end
