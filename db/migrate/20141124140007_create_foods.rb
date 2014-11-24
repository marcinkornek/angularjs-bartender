class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :size
      t.decimal :price
      t.integer :category_id, default: 1

      t.timestamps
    end
  end
end
