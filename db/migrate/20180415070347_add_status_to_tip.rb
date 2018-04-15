class AddStatusToTip < ActiveRecord::Migration[5.2]
  def change
    add_column :tips, :status, :integer
  end
end
