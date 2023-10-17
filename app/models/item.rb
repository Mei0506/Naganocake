class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, :order_details, dependent: :destroy
  
  def add_tax_price
    (self.price.to_i*1.08).to_i
  end
end
