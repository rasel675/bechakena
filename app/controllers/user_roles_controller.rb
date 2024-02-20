class UserRolesController < ApplicationController
  def index
    if current_user.super_admin?
    @users = User.all
    else
      redirect_to user_role_path(current_user)
    end
  end

  def show
    authorize :user_role, :show?

    find_user
  end

  def edit
    find_user
  end

  def update
    find_user
    if User.update(user_params)
      redirect_to :user_role_path, notice:  "User info updated successfully"
    else
      redirect_to :edit, notice: "Something went wrong"
    end
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :username, :email, :roles)
    end

end
