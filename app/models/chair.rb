class Chair < ActiveRecord::Base
  scope :active, -> { where(active: true) }
  scope :ordered_by_name, -> { order(model: :asc) }
end
