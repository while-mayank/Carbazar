class AddColumncToEnquiry < ActiveRecord::Migration[6.1]
  def change
    add_reference :enquiries, :car, null: false, foreign_key: true
  end
end
