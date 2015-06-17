class Cubicle < ActiveRecord::Base
  enum purchase_type: [:purchase, :lease]
  # square meters = m2
  # square feet = ft2
  enum unit_of_measure: [:m2, :ft2]

  scope :active, -> { where(active: true) }
  scope :ordered_by_name, -> { order(name: :asc) }
  default_scope { active.ordered_by_name }

  validates_presence_of :name, :height, :area, :description, :unit_of_measure, :purchase_type
  validates_uniqueness_of :name
  validates_presence_of :nrc, if: -> (form) { form.purchase? }
  validates_presence_of :mrc, if: -> (form) { form.lease? }

  alias_attribute :cost_per_item, :nrc
end
