class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.save
      flash[:notice] = "登録情報を変更しました。"
      redirect_to admin_order_path(@order.id)
    else
      flash.now[:notice] = "もう一度入力してください。"
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

end
