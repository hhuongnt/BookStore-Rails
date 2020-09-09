class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  before_save :update_subtotal

  def subtotal
    order_items.inject(0) { |sum, item| sum + item.book.price }
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
