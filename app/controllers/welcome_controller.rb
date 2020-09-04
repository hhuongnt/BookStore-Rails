class WelcomeController < ApplicationController
  def index
    @books = Book.first(10)
    @current_order = current_order
    @order_item = current_order.order_items.new
  end
end
