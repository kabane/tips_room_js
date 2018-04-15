class AddUserIdToTip < ActiveRecord::Migration[5.2]
  def change
    add_column :tips, :user_id, :integer 
  end
end
