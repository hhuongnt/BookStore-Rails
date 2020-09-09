class Book < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :category

  mount_uploaders :photos, PhotoUploader
  validates_presence_of :name, :description, :author, :published_on, :photos
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  def self.search(search)
    category_id = Category.find_by('lower(name) = ?', search.downcase)
    @books = if category_id.present?
               @books.where(category_id: category_id)
             else
               @books.where('title LIKE ?', "%#{search}%")
             end
  end
end
