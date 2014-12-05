class DeleteSizeAndPriceColumnsInProducts < ActiveRecord::Migration
  def change
    remove_column :products, :price, :decimal
    remove_column :products, :size, :string
    remove_column :products, :product_type, :string
  end
end
