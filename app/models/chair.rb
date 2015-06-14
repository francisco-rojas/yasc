class Chair < ActiveRecord::Base
  scope :active, -> { where(active: true) }
  scope :ordered_by_name, -> { order(name: :asc) }
  default_scope { active.ordered_by_name }

  validates_presence_of :name, :model, :description, :nrc
  validates_uniqueness_of :name
end
