class OrderItemsController < ApplicationController
  before_action :prepare_order, :prepare_order_item, only: :add_to_cart

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  def add_to_cart
    store_session
    @order.reload
    @quantity = @order.order_items.pluck(:quantity).inject(:+)
  end

  private

  def prepare_order
    @order = current_order
  end

  def prepare_order_item
    @order_item = @order.order_items.find_by(book_id: order_item_params.dig('book_id')) || @order.order_items.new
    @order_item.quantity = @order_item.quantity.to_i + order_item_params.dig('quantity').to_i
    @order_item.book_id = order_item_params.dig('book_id')
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :book_id)
  end

  def store_session
    @order.save!
    @order_item.save!

    session[:order_id] = @order.id
  end
end
