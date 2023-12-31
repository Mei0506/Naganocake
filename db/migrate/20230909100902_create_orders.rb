class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :postal_code, null: false
      t.string :adress, null: false
      t.string :name, null: false
      t.integer :payment_method, null: false
      t.integer :postage, null: false
      t.integer :payment_total, null: false
      t.integer :status, null: false
      t.timestamps
    end
  end
end
