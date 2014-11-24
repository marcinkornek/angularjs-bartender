class CreateOrderDetailsTable < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :amount
      t.decimal :price
      t.integer :order_id
      t.integer :orderable_id
      t.string :orderable_type
    end
  end
end
