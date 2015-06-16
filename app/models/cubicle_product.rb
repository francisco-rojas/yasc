class CubicleProduct < ActiveRecord::Base
  has_one :item, as: :purchase_product
  belongs_to :cubicle

  validates_presence_of :cubicle
end
