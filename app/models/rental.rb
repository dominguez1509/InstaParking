class Rental < ActiveRecord::Base
  has_many :spaces

  accepts_nested_attributes_for :spaces, :allow_destroy => true
end
