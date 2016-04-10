class Rental < ActiveRecord::Base
  has_many :spaces
  belongs_to :user
  belongs_to :city

  accepts_nested_attributes_for :spaces, :allow_destroy => true
end
