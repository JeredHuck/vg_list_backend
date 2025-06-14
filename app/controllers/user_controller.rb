class UserController < ApplicationController
  def index
    @users = User.all
    render json: UserBlueprint.render(@users)
  end

  def show
    @user = User.find(params[:id])
    render json: UserBlueprint.render(@user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserBlueprint.render(@user), status: :created
    else 
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: UserBlueprint.render(@user)
    else 
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: { message: "User deleted successfully" }, status: :ok
  end

  private 
  def user_params
    params.require(:user).permit(:username, :password)
  end
end