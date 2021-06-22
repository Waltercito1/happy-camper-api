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
    #list.categories = Category.all
    # Category.all.each do | category |
    #   Category.create(name: category.name, list: list)
    # end
    #byebug
    if list.save
      render json: list, status: :created, location: list
    else
      render json: list.errors, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])
    #list.categories = Category.all
    if list.update(list_params)
      params[:list_items_attributes].each do |item|
        list.items << Item.create(item.permit(:name, :packed, :category_id))
        byebug
      end
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
      params.require(:list).permit(:title, :user_id, :categories, list_items_attributes:[:name, :packed, :category_id])
    end

    def item_params
      params.require(:list_items_attributes).permit(:name, :packed, :category_id)
    end
end
