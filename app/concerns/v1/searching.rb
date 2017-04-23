module V1
  module Searching
    extend ActiveSupport::Concern

    included do
      before_action :find_group
    end

    private

    def find_group
      @group = Group.find_by(id: params[:group_id])
      head :not_found unless @group
    end

  end
end
