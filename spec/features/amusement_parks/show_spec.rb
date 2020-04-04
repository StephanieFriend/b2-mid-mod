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
    racer = hershey.rides.create({name: 'Lightning Racer',
                      thrill_rating: 7})
    runner = hershey.rides.create({name: 'Storm Runner',
                       thrill_rating: 9})
    bear = hershey.rides.create({name: 'The Great Bear',
                     thrill_rating: 5})

    visit "/amusement_parks/#{hershey.id}"
#find a way to test the order of rides
    expect(page).to have_content('Rides:')
    expect(page).to have_content("#{racer.name}")
    expect(page).to have_content("#{runner.name}")
    expect(page).to have_content("#{bear.name}")
  end

  it 'I can see the average thrill rating of rides' do
    hershey = AmusementPark.create({name: 'Hershey Park',
                                 admission_price: '$50.00'})
    racer = hershey.rides.create({name: 'Lightning Racer',
                      thrill_rating: 7})
    runner = Ride.create({name: 'Storm Runner',
                       thrill_rating: 9})
    bear = Ride.create({name: 'The Great Bear',
                     thrill_rating: 5})

    visit "/amusement_parks/#{hershey.id}"

    expect(page).to have_content("Average Thrill Rating of Rides: 7.0/10")
  end
end
