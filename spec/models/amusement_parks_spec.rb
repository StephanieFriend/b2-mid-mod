require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'instance methods' do
    it '.ride_alphabetically_sort'
    hershey = AmusementPark.create({name: 'Hershey Park',
                                    admission_price: '$50.00'})
    racer = Ride.create({name: 'Lightning Racer',
                         thrill_rating: 7,
                         amusement_parks_id: hershey.id})
    runner = Ride.create({name: 'Storm Runner',
                          thrill_rating: 9,
                          amusement_parks_id: hershey.id})
    bear = Ride.create({name: 'The Great Bear',
                        thrill_rating: 5,
                        amusement_parks_id: hershey.id})

    expect(hershey.ride_alphabetically_sort).to eq()
  end
  it'.average_rating' do
    hershey = AmusementPark.create({name: 'Hershey Park',
                                    admission_price: '$50.00'})
    racer = Ride.create({name: 'Lightning Racer',
                         thrill_rating: 7,
                         amusement_parks_id: hershey.id})
    runner = Ride.create({name: 'Storm Runner',
                          thrill_rating: 9,
                          amusement_parks_id: hershey.id})
    bear = Ride.create({name: 'The Great Bear',
                        thrill_rating: 5,
                        amusement_parks_id: hershey.id})

    expect(hershey.average_rating).to eq(7)
  end
end
