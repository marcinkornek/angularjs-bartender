class AddSizeAndSizeTypeToOrderDetails < ActiveRecord::Migration
  def change
    add_column :order_details, :size, :string
    add_column :order_details, :size_type, :string
  end
end
