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
      redirect_to admin_item_path(@item.id)
    else
      flash.now[:notice] = "もう一度入力してください。"
      render :new
    end
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:notice] = "登録情報を変更しました。"
      redirect_to admin_item_path(@item.id)
    else
      flash.now[:notice] = "もう一度入力してください。"
      render :edit
    end
  end
  
  

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_selling, :image)
  end
  
end