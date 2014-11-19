class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if user_authorized?
      @user.update(user_params)
    end

    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if user_authorized?
      @user.destroy
    end

    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(
      :city,
      :email,
      :first_name,
      :last_name,
      :password,
      :phone,
      :picture,
      :street_address,
      :state,
      :zip
    )
  end
end
