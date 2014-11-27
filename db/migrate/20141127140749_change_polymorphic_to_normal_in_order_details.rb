class ChangePolymorphicToNormalInOrderDetails < ActiveRecord::Migration
  def change
    remove_column :order_details, :orderable_id
    remove_column :order_details, :orderable_type
    add_column :order_details, :product_id, :integer
  end
end
