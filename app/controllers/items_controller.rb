class ItemsController < ApplicationController
  def new
    form_object
    load_locations
    load_products
  end

  def create
    form_object.attributes = form_object_params

    if form_object.submit(current_order)
      render js: "window.location = '/checkout'"
    else
      render_specific(:create)
    end
  end

  private

  def form_object_params
    params.
      require(form_object.class.name.underscore).
      permit(form_object.permitted_params)
  end

  def load_locations
    @buildings = Building.all
    @floors = Floor.all
  end
end
