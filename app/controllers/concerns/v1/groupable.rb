module V1
  module Groupable
    extend ActiveSupport::Concern

    included do
      before_action :find_group
    end

    private

    def find_group
      @group = current_user.groups.find_by(id: params[:group_id])
      head :not_found unless @group
    end
<<<<<<< 4f52e0f1d6eb81057d222fe0f906647ae6985b1e

    def find_present_students
<<<<<<< d9d731eaeea8e8673d191dcb08e794be672f94bc
<<<<<<< 72d59ee036847a4966334687cc75c280e5f58758:app/controllers/concerns/v1/groupable.rb
      @students = @group.students.present(@day)
=======
      @students = @group.students.present
>>>>>>> LVRUBYM-219: Fixed controller and tests:app/concerns/v1/groupable.rb
=======
      @students = @group.students.present
>>>>>>> LVRUBYM-219: Fixed controller and tests
    end
=======
>>>>>>> LVRUBYM-221:Changed controllers
  end
end
