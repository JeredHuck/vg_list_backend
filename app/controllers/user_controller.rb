class UserController < ApplicationController
    def index
        @users = users.all
        render json: UserBlueprint.render(users)
    end

    def show
        @user = User.find(params[:id])
        render json: UserBlueprint.render(user)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: UserBlueprint.render(user), status: :created
        else 
            render json: { errors: user.errors.full_messages }: :unprocessable_entity
        end
    end

    def update
        user = User.find(params[:id])
        if user.update!(user_params)
            render UserBlueprint.render(user)
            redirect_to user
        else 
            render json: { errors: user.errors.full_messages }: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: @user, status: :ok
    end

    private 
    def user_params
        params.expect(user: [:username, :password])
    end
end
