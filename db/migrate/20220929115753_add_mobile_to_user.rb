class AddMobileToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :mobile, :string
    add_index :users, :mobile, unique: true
  end
end
