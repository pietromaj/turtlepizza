class Pizza < ActiveRecord::Base
  has_many :relationships, dependent:  :destroy
  has_many :image_relationships, dependent:  :destroy
  has_many :toppings, through: :relationships, source: :topping
  has_many :images, through: :image_relationships, source: :image
  has_many :doe_kinds
end
