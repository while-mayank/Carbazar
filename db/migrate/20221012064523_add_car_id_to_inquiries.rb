class AddCarIdToInquiries < ActiveRecord::Migration[6.1]
  def change
    add_reference :inquiries, :car, null: false, foreign_key: true
  end
end
