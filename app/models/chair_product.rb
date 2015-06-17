class ChairProduct < ActiveRecord::Base
  delegate :name, :cost_per_item, to: :chair

  has_one :item, as: :purchase_product
  belongs_to :chair

  validates_presence_of :chair
end
