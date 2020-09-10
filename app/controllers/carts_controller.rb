class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @quantity = current_order.order_items.pluck(:quantity).inject(:+)
    @order_items = current_order.order_items
  end
end
