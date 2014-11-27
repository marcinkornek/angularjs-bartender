class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :type
      t.string :name
      t.string :size
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
