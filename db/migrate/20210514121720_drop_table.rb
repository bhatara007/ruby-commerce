class DropTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :orderrs
    drop_table :orders
    drop_table :ors
    drop_table :customer_orders
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
