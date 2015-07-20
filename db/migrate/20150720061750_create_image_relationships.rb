class CreateImageRelationships < ActiveRecord::Migration
  def change
    create_table :image_relationships do |t|
      t.integer :pizza_id
      t.integer :image_id
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
