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
    params[:categories_attributes].each do |cat|
      Category.create(cat.permit(:name, :list_id))
    end
    params[:items_attributes].each do |item|
      name = Category.find(item[:category_id]).name
      list_category = list.categories.find_by(name: name)
      item[:category_id] = list_category.id
      Item.create(item.permit(:name, :packed, :category_id))
    end
    
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
      params.require(:list).permit(:title, :user_id, categories_attributes: [:name, :list_id], items_attributes:[:name, :packed, :category_id])
    end

    def item_params
      params.require(:list_items_attributes).permit(:name, :packed, :category_id)
    end
end
