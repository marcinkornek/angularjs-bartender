class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :size
      t.decimal :price
      t.integer :category_id, default: 2

      t.timestamps
    end
  end
end
