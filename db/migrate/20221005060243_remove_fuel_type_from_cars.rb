class RemoveFuelTypeFromCars < ActiveRecord::Migration[6.1]
  def change
    remove_column :cars, :fuel_type, :string
  end
end
