class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :building
  belongs_to :floor
  belongs_to :product, polymorphic: true, dependent: :destroy

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cost_per_item, :total_amount, numericality: { greater_than_or_equal_to: 0 }
  validates_presence_of :order, :product, :cost_per_item, :quantity, :total_amount
end
