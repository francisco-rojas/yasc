class Lamp < ActiveRecord::Base
  validates_presence_of :name, :description, :nrc
end