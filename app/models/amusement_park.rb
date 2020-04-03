class AmusementPark < ApplicationRecord
  validates_presence_of :name, :admission_price

  has_many :rides

  def ride_alphabetically_sort
    binding.pry
    rides.order(:name)
  end

  def average_rating
    rides.average(:thrill_rating)
  end
end