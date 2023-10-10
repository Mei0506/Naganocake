class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
      @customer = current_customer
  end
  
  def edit
      @customer = current_customer
  end

  def update
      @customer = current_customer
      if @customer.update(customer_params)
         flash[:succes] = "登録情報を変更しました。"
         redirect_to customers_mypage_path
      else
          render 'edit'
      end
  end

  def confirm_withdraw
  end

  def withdraw
     @customer = current_customer
     @customer.update(is_deleted: true)
     reset_session
     flash[:notice] = "退会手続きが完了しました。またのご利用をお待ちしております。"
     redirect_to root_path
  end

  private
   def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_customer_status)
   end
end