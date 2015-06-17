class CubicleProduct < ActiveRecord::Base
  delegate :name, :cost_per_item, to: :cubicle

  has_one :item, as: :purchase_product
  belongs_to :cubicle

  validates_presence_of :cubicle
end
