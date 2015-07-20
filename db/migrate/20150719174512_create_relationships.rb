class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :pizza_id
      t.integer :topping_id

      t.timestamps null: false
    end
  end
end
