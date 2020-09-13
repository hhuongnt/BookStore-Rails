class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @quantity = current_order.order_items.pluck(:quantity).inject(:+)
    @order_items = current_order.order_items
    @total = 0
    @order_items.each do |item|
      @total += item.total_price
    end
  end
end
