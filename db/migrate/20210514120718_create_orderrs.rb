class CreateOrderrs < ActiveRecord::Migration[6.1]
  def change
    create_table :orderrs do |t|

      t.timestamps
    end
  end
end
