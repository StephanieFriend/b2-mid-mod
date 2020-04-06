require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'instance methods' do
    it '.ride_alphabetically_sort' do
    hershey = AmusementPark.create({name: 'Hershey Park',
                                    admission_price: '$50.00'})
    racer = hershey.rides.create({name: 'Lightning Racer',
                         thrill_rating: 7})
    runner = hershey.rides.create({name: 'Storm Runner',
                          thrill_rating: 9})
    bear = hershey.rides.create({name: 'The Great Bear',
                        thrill_rating: 5})

    expect(hershey.ride_alphabetically_sort).to eq([racer, runner, bear])
    end
  end
  it'.average_rating' do
    hershey = AmusementPark.create({name: 'Hershey Park',
                                    admission_price: '$50.00'})
    racer = hershey.rides.create({name: 'Lightning Racer',
                         thrill_rating: 7})
    runner = hershey.rides.create({name: 'Storm Runner',
                          thrill_rating: 9})
    bear = hershey.rides.create({name: 'The Great Bear',
                        thrill_rating: 5})

    expect(hershey.average_rating).to eq(7)
  end
end
