class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :current_order

  def current_order
    @current_order ||= current_user.
                       orders.
                       with_items.
                       opened.
                       first_or_create(status: :opened,
                                       user: current_user,
                                       total_amount: 0)
  end
end
