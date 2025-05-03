class UserController < ApplicationController
    def index
        @users = users.all
        render json: @users, status: :ok
    end

    def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else 
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def update
        user = User.find(params[:id])
        user.update!(user_params)
        redirect_to user
    end

    private 
    def user_params
        params.expect(user: [:id, :username, :password])
    end
end
