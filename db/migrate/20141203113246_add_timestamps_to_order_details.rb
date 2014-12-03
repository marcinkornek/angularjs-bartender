class AddTimestampsToOrderDetails < ActiveRecord::Migration
  def change
    add_timestamps(:order_details)
  end
end
