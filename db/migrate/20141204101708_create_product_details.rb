class CreateProductDetails < ActiveRecord::Migration
  def change
    create_table :product_details do |t|
      t.string :size_type
      t.string :size
      t.decimal :price
      t.integer :product_id

      t.timestamps
    end
  end
end
