class CubiclesForm
  include ActiveModel::Model

  PARAMS = [:quantity, :building, :floor, :room,
            :product, :purchase_type].freeze
  attr_accessor *PARAMS

  validates_presence_of *PARAMS
  validates_numericality_of :quantity, only_integer: true

  def persisted?
    false
  end

  def submit(order)
    if valid?
      add_to_cart(order)
    else
      false
    end
  end

  private
  def data
    PARAMS.inject({}) { |h, v| h[v] = send(v); h }
  end

  def add_to_cart(order)
    purchaser = PurchaseService.new(order)
    purchaser.add_to_cart(data, build_cubicle_product, quantity)
  rescue => ex
    Rails.logger.error ex
    false
  end

  def build_cubicle_product
    CubicleProduct.new(cubicle: product)
  end
end