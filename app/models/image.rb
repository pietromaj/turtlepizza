class Image < ActiveRecord::Base
  has_many :image_relationships, dependent:  :destroy
  mount_uploader :picture, PictureUploader
end
