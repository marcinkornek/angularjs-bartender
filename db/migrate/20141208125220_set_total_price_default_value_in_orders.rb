class SetTotalPriceDefaultValueInOrders < ActiveRecord::Migration
  def change
    change_column_default(:orders, :total_price, 0)
  end
end
