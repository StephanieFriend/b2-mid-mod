class AmusementPark < ApplicationRecord
  has_many :rides

  def ride_alphabetically_sort
    rides.order(:name)
  end

  def average_rating
    rides.average(:thrill_rating)
  end
end