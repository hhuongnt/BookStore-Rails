class WelcomeController < ApplicationController
  def index
    @books = Book.first(10)
    @quantity = current_order.order_items.pluck(:quantity).inject(:+)
    @order_item = current_order.order_items.new
  end
end
