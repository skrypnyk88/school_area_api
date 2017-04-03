module V1
  class PresenceReportsController < ApplicationController
<<<<<<< 3d6ef24b1f115a08fa031f7cb22c9e05126b0cb6
    include Groupable
    include Reportable

    def index
      @reports = reports_renderer(@group.students, PresenceReport).call
=======
    def index
      @presence_reports = PresenceReport.all
>>>>>>> LVRUBYM-190: User actions on backend
    end
  end
end
