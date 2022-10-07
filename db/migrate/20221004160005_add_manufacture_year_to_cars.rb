class AddManufactureYearToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :manufacture_year, :smallint
  end
end
