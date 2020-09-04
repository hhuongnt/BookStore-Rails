class Book < ApplicationRecord
  has_many :order_items

  mount_uploaders :photos, PhotoUploader
  validates_presence_of :name, :description, :author, :published_on, :price, :photos
end
