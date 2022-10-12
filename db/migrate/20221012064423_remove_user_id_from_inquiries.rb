class RemoveUserIdFromInquiries < ActiveRecord::Migration[6.1]
  def change
    remove_reference :inquiries, :user, null: false, foreign_key: true
  end
end
