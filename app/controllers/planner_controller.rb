class PlannerController < ApplicationController
  def index
    @is_guest = guest_mode?
    @user = current_user
  end
end
