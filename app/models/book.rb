class Book < ApplicationRecord
  has_many :order_items
  belongs_to :category

  mount_uploaders :photos, PhotoUploader
  validates_presence_of :name, :description, :author, :published_on, :photos
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
