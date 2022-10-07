class CreateInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiries do |t|
      t.string :content
      t.bigint :number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
