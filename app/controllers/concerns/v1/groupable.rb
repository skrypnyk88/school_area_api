module V1
  module Groupable
    extend ActiveSupport::Concern

    included do
      before_action :find_group
      before_action :find_present_students
    end

    private

    def find_group
      @group = current_user.groups.find_by(id: params[:group_id])
      head :not_found unless @group
    end

    def find_present_students
      @students = @group.students.present(@day)
    end
  end
end
