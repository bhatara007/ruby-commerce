class AddProductIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :product_id, :string
    remove_column :orders, :product
    remove_column :orders, :product_name
  end
end
