class DoeKind < ActiveRecord::Base
  belongs_to :pizza, class_name: "Pizza"
end
