class CreateOrs < ActiveRecord::Migration[6.1]
  def change
    create_table :ors do |t|
      t.string :cumtomer_name
      t.string :address
      t.string :product_name

      t.timestamps
    end
  end
end
