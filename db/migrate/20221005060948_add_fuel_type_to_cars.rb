class AddFuelTypeToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :fuel_type, :text, array: true, default: []
  end
end
