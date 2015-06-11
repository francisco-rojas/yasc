class ItemsController < ApplicationController
  def new
    render_specific 'new'
  end

  private
  def item_type
    if %(books, lamps, houses, cars).include?(params[:type])
      @item_type ||= params[:type].try(:to_sym)
    else
      raise('Invalid Item Type')
    end
  end

  def item_class
    item_type.to_s.singularize.capitalize.constantize
  end

  def render_specific(view, params = {})
    render "items/#{item_type}/#{view}", params
  end
end