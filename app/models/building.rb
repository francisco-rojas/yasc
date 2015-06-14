class Building < ActiveRecord::Base
  has_many :floors, dependent: :destroy

  validates_presence_of :name, :address
  validates_uniqueness_of :name
end
