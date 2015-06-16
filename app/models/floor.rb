class Floor < ActiveRecord::Base
  belongs_to :building

  validates_presence_of :name, :number, :building_id
  validates_uniqueness_of :name
  validates :number, uniqueness: { scope: :building_id }

  default_scope { order(name: :asc) }
end
