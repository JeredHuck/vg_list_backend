class ListsController < ApplicationController
    def index 
        @lists = List.all
        render json: ListBLueprint.render(lists)
    end

    def show
        @list = List.find(params[:id])
        render json: ListBLueprint.render(list)
    end

    def create
        @list = List.new(list_params)
        if @list.save
            render json: ListBLueprint.render(list), status: :created
        else 
            render json: { errors: list.errors.full_messages }: :unprocessable_entity
        end
    end

    def update
        list = List.find(params[:id])
        if list.update!(list_params)
            render ListBLueprint.render(list)
            redirect_to list
        else 
            redner json: { errors: list.errors.full_messages }: :unprocessable_entity
        end
    end

    def destroy
        list = List.find(params[:id])
        list.destroy
        render json: @list, status: :ok
    end

    private 
    def list_params
        params.expect(list: [:title, :content])
    end
end