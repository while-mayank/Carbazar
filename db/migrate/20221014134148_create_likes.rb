class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :like_type
      t.references :likeable, polymorphic: true, null: false
    
      t.timestamps
    end
    add_index :likes, [:user_id, :likeable_id, :like_type, :likeable_type], unique: true, name: :coustom_index_name
  end
end
