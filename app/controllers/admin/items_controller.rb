class Admin::ItemsController < ApplicationController
  
  def new
    @items = Item.new
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def index
    @items = Item.all.page(params[:page]).per(10)
  end
  
  def create
    @item = Item.new(item_params)
  end
  
  def update
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_selling, :image)
  end
  
end