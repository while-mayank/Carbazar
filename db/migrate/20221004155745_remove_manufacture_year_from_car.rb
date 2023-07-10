class RemoveManufactureYearFromCar < ActiveRecord::Migration[6.1]
  def change
    remove_column :cars, :manufacture_year, :date
  end
end
