class ChairsController < ItemsController
  private

  def form_object
    @form_object ||= ChairsForm.new
  end

  def load_products
    @products = Chair.all
  end
end
