class AmusementPark < ApplicationRecord
  validates_presence_of :name, :admission_price

  has_many :rides, dependent: :destroy

  def ride_alphabetically_sort
    rides.order(:name)
  end

  def average_rating
    rides.average(:thrill_rating)
  end
end