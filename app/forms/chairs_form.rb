class ChairsForm
  include ActiveModel::Model

  PARAMS = [:quantity, :building, :floor, :room, :product, :extra_info].freeze
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

  def product=(id)
    @product = Chair.find_by(id: id)
  end

  def building=(id)
    @building = Building.find_by(id: id)
  end

  def floor=(id)
    @floor = Floor.find_by(id: id)
  end

  def quantity=(value)
    @quantity = value.try(:to_i)
  end

  def attributes=(attributes)
    PARAMS.each do |attr|
      self.send("#{attr}=", attributes[attr])
    end
    self
  end

  def permitted_params
    [*PARAMS, extra_info: [:number_of_legs, :color, :with_back_rest]]
  end

  private
  def data
    PARAMS.inject({}) { |h, v| h[v] = send(v); h }
  end

  def add_to_cart(order)
    purchaser = PurchaseService.new(order)
    purchaser.add_to_cart(data, build_chair_product, quantity)
  # rescue => ex
  #   Rails.logger.error ex
  #   false
  end

  def build_chair_product
    ChairProduct.new(chair: product)
  end
end
