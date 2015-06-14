class Cubicle < ActiveRecord::Base
  enum purchase_type: [:purchase, :lease]
  # square meters = m2
  # square feet = ft2
  enum unit_of_measure: [:m2, :ft2]

  scope :active, -> { where(active: true) }
  scope :ordered_by_unit_of_measure, -> { order(unit_of_measure: :asc) }
end
