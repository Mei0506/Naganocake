class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
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
    if @item.save
      flash[:notice] = "商品の新規登録に成功しました。"
      redirect_to admin_items_path
    else
      flash.now[:notice] = "商品の新規登録に失敗しました。"
      render :new
    end
  end
  
  def update
    @item = Item.find(params[:id])
  end

  def add_tax_price
    (self.price * 1.08).round
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_selling, :image)
  end
  
end