require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I see the name and price of admissions when I visit an amusement parks show page' do
    hershey = AmusementPark.create({name: 'Hershey Park',
                                 admission_price: '$50.00'})

    visit "/amusement_parks/#{hershey.id}"

    expect(page).to have_content(hershey.name)
    expect(page).to have_content("Admissions: #{hershey.admission_price}")
  end
  it 'I see the names of all rides in alphabetical order' do
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


    visit "/amusement_parks/#{hershey.id}"

    expect(page).to have_content('Rides:')
    expect(page).to have_content("1. #{racer.name}")
    expect(page).to have_content("2. #{runner.name}")
    expect(page).to have_content("3. #{bear.name}")
  end

  it 'I can see the average thrill rating of rides' do
    hershey = AmusementPark.new({name: 'Hershey Park',
                                 admission_price: '$50.00'})
    racer = Ride.new({name: 'Lightning Racer',
                      thrill_rating: 7,
                      amusement_parks_id: hershey.id})
    runner = Ride.create({name: 'Storm Runner',
                       thrill_rating: 9,
                       amusement_parks_id: hershey.id})
    bear = Ride.create({name: 'The Great Bear',
                     thrill_rating: 5,
                        amusement_parks_id: hershey.id})

    visit "/amusement_parks/#{hershey.id}"

    expect(page).to have_content("Average Thrill Rating of Rides: 7/10")
  end
end
