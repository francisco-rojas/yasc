class OrdersController < ApplicationController
  def checkout
  end

  def remove_item
    PurchaseService.new(current_order).remove_from_cart(params[:id])
    redirect_to checkout_path
  end
end