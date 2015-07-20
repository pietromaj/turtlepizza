class Relationship < ActiveRecord::Base
  belongs_to :pizza, class_name: "Pizza"
  belongs_to :topping, class_name: "Topping"
  
    validates_uniqueness_of  :topping_id, scope: :pizza_id
end
