class ProfileController < ApplicationController
  def show
    @user = current_user
    @is_guest = guest_mode?
  end
end
