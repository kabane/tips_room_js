class CreateTipTag < ActiveRecord::Migration[5.2]
  def change
    create_table :tip_tags do |t|
      t.integer :tip_id
      t.integer :tag_id
    end
  end
end
