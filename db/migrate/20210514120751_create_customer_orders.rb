class CreateCustomerOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_orders do |t|

      t.timestamps
    end
  end
end
