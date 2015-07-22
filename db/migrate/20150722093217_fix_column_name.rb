class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :image_relationships, :order_id, :position
  end
end
