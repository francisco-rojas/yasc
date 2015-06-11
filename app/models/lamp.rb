class Lamp < ActiveRecord::Base
  validates_presence_of :name, :description, :nrc

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
end