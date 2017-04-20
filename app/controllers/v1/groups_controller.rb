module V1
  class GroupsController < ApplicationController
    def index
      @groups = current_user.groups
    end
  end
end
