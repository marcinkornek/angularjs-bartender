class RemoveSizeTypeInProductDetails < ActiveRecord::Migration
  def change
    remove_column :product_details, :size_type, :string
  end
end
