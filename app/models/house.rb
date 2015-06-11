class House < ActiveRecord::Base
  enum purchase_type: [:purchase, :lease]
  validates_presence_of :name, :description, :nrc, :mrc, :purchase_type
end