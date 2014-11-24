class CreateSnacks < ActiveRecord::Migration
  def change
    create_table :snacks do |t|
      t.string :name
      t.string :size
      t.decimal :price
      t.integer :category_id, default: 3

      t.timestamps
    end
  end
end
