class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = Order_detail.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.save
      flash[:notice] = "登録情報を変更しました。"
      redirect_to admin_order_path(@order_detail.id)
    else
      flash.now[:notice] = "もう一度入力してください。"
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
