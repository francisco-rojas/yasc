class ChairsForm
  include ActiveModel::Model

  PARAMS = [:quantity, :building, :floor, :room, :product].freeze
  attr_accessor *PARAMS

  validates_presence_of *PARAMS

  def persisted?
    false
  end

  def submit(purchase_order)
    if valid?

    else
      errors.add(:base, 'Errors preventing to save')
      false
    end
  end
end