class CubiclesForm
  include ActiveModel::Model

  PARAMS = [:quantity, :building, :floor, :room,
            :product, :purchase_type].freeze
  attr_accessor *PARAMS

  validates_presence_of *PARAMS
end