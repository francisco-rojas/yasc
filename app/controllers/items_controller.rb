class ItemsController < ApplicationController
  def new
    load_form_object
    load_products
    render_specific 'new'
  end

  def create
    load_form_object
  end

  private
  def form_object_params
    params.require(form_object_type).permit(form_object_class::PARAMS)
  end

  def item_type
    if %(cublicles, chairs).include?(params[:type])
      @item_type ||= params[:type].try(:to_sym)
    else
      raise('Invalid Item Type')
    end
  end

  def item_class
    item_type.to_s.singularize.camelize.constantize
  end

  def form_object_type
    "#{item_type}_form".to_sym
  end

  def form_object_class
    form_object_type.to_s.camelize.constantize
  end

  def load_form_object
    @form = form_object_class.new
  end

  def load_products
    @products = item_class.all
  end

  def product_type
    if %(cublicles, chairs).include?(params[:product_type])
      @product_type ||= params[:product_type].try(:to_sym)
    else
      @product_type = nil
    end
  end

  def render_specific(view, params = {})
    render "items/#{item_type}/#{view}", params
  end
end