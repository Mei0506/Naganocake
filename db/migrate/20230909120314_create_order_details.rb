class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :unit_price, null: false
      t.integer :quantitiy, null: false
      t.integer :making_status, null: false
      t.timestamps
    end
  end
end
