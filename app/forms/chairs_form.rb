class ChairsForm
  include ActiveModel::Model

  PARAMS = [:quantity, :building, :floor, :room, :product].freeze
  attr_accessor *PARAMS

  validates_presence_of *PARAMS
end