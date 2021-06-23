class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :check_user
  
  def show
    unless is_author?(@user)
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    unless is_author?(@user)
      redirect_to current_user, danger: "Vous ne pouvez pas éditer un compte qui n'est pas le votre"
    end
  end

  def update
    if is_author?(@user)
      if @user.update(user_params)
        redirect_to @user, success: "Vos informations ont été mises à jour"
      else
        render :edit
      end
    else
      redirect_to user_path(params[:id]), danger: "Vous ne pouvez pas éditer un compte qui n'est pas le votre"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :classification, :description, :phone, :address, :zip_code, :city, :date_of_birth)
  end

  def check_user
    @user = User.find(params[:id])
  end
end