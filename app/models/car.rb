class Car < ActiveRecord::Base
  enum purchase_type: [:purchase, :lease]
  validates_presence_of :name, :description, :nrc, :mrc, :purchase_type

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :ordered_by_name, -> { order(name: :asc) }
end