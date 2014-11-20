class DashboardsController < ApplicationController
  def show
    @user = current_user

    redirect_to user_path(@user)
  end
end
