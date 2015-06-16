class ChairProduct < ActiveRecord::Base
  has_one :item, as: :purchase_product
  belongs_to :chair

  validates_presence_of :chair
end
