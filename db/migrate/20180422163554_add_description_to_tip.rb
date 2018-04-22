class AddDescriptionToTip < ActiveRecord::Migration[5.2]
  def change
    add_column :tips, :description, :text
  end
end
