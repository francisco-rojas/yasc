class BooksForm
  include ActiveModel::Model

  PARAMS = [:quantity, :location, :color, :book].freeze
  attr_accessor *PARAMS

  validates_presence_of :quantity, :location, :color
end