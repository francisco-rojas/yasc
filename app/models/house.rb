class House < ActiveRecord::Base
  enum purchase_type: [:purchase, :lease]
  validates_presence_of :name, :description, :nrc, :mrc, :purchase_type

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
end