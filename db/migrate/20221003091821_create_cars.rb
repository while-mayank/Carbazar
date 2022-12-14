class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :price
      t.date :manufacture_year
      t.string :fuel_type
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
