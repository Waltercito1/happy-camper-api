class ListsController < ApplicationController

  def index
    lists = List.all
    render json: lists
  end

  def show
    list = List.find(params[:id])
    render json: list
  end

  def create
    list = List.new(list_params)

    if list.save
      render json: list, status: :created, location: list
    else
      render json: list.errors, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
  end

  private
    def list_params
      params.require(:list).permit(:title, :user_id, :categories)
    end
end
