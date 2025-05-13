class ListsController < ApplicationController
  def index
    @lists = List.all
    render json: ListBlueprint.render(@lists)
  end

  def show
    @list = List.find(params[:id])
    render json: ListBlueprint.render(@list)
  end

  def create
    @list = List.new(list_params)
    if @list.save
      render json: ListBlueprint.render(@list), status: :created
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      render json: ListBlueprint.render(@list)
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    render json: { message: "List deleted successfully" }, status: :ok
  end

  private

  def list_params
    params.require(:list).permit(:title, :content)
  end
end