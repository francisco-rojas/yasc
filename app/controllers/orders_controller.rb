class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.submitted
  end

  def checkout
  end

  def place_order
    OrderService.new(current_order).place_order
    redirect_to orders_path
  end

  def remove_item
    PurchaseService.new(current_order).remove_from_cart(params[:id])
    redirect_to checkout_path
  end
end