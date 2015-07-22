class ImageRelationship < ActiveRecord::Base
  belongs_to :pizza, class_name: "Pizza"
  belongs_to :image, class_name: "Image"
  acts_as_list :scope => :pizza
end
