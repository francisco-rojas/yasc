class CubiclesController < ItemsController
  private

  def form_object
    @form_object ||= CubiclesForm.new
  end

  def load_products
    @products = Cubicle.all
  end
end
