class ChairsForm
  include ActiveModel::Model

  PARAMS = [:quantity, :building, :floor, :room, :product].freeze
  attr_accessor *PARAMS

  validates_presence_of *PARAMS
  validates_numericality_of :quantity, only_integer: true

  def persisted?
    false
  end

  def submit(purchase_order)
    if valid?
    else
      false
    end
  end
end