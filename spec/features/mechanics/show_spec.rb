require 'rails_helper'

RSpec.describe 'As a user' do
  it 'I see mechanic name, years of experience, and names of all rides' do
  mills = Mechanic.create({name: 'Sam Mills',
                        years_of_experience: 10})
  smith = Mechanic.create({name: 'Kara Smith',
                        years_of_experience: 11})
  hershey = AmusementPark.create({name: 'Hershey Park',
                                  admission_price: '$50.00'})
  racer = hershey.rides.create({name: 'Lightning Racer',
                       thrill_rating: 7})
  runner = hershey.rides.create({name: 'Storm Runner',
                        thrill_rating: 9})
  bear = hershey.rides.create({name: 'The Great Bear',
                      thrill_rating: 5})

  RideMechanic.create({ride_id: racer.id, mechanic_id: mills.id})
  RideMechanic.create({ride_id: runner.id, mechanic_id: mills.id})
  RideMechanic.create({ride_id: bear.id, mechanic_id: mills.id})
  RideMechanic.create({ride_id: racer.id, mechanic_id: smith.id})
  RideMechanic.create({ride_id: runner.id, mechanic_id: smith.id})

  visit "/mechanics/#{mills.id}"

  expect(page).to have_content(mills.name)
  expect(page).to have_content("#{mills.years_of_experience} years of experience")
  expect(page).to have_content("Current rides they're working on:")
  expect(page).to have_content(racer.name)
  expect(page).to have_content(runner.name)
  expect(page).to have_content(bear.name)
  expect(page).to_not have_content(smith.name)
  end

  it 'I see a form to add a ride to the mechanics workload' do
    mills = Mechanic.create({name: 'Sam Mills',
                             years_of_experience: 10})
    smith = Mechanic.create({name: 'Kara Smith',
                             years_of_experience: 11})
    hershey = AmusementPark.create({name: 'Hershey Park',
                                    admission_price: '$50.00'})
    hopper = hershey.rides.create({name: 'The Frog Hopper',
                                  thrill_rating: 10})
    fahrenheit = hershey.rides.create({name: 'Fahrenheit',
                                   thrill_rating: 7})
    raise = hershey.rides.create({name: 'The Kiss Raise',
                                 thrill_rating: 2})

    RideMechanic.create({ride_id: hopper.id, mechanic_id: mills.id})
    RideMechanic.create({ride_id: fahrenheit.id, mechanic_id: mills.id})
    RideMechanic.create({ride_id: raise.id, mechanic_id: mills.id})
    RideMechanic.create({ride_id: hopper.id, mechanic_id: smith.id})
    RideMechanic.create({ride_id: raise.id, mechanic_id: smith.id})

    visit "/mechanics/#{smith.id}"

    expect(page).to have_content("Add a ride to workload:")
    expect(page).to_not have_content(fahrenheit.name)

    fill_in :ride_id, with: "#{fahrenheit.id}"

    click_button 'Submit'

    expect(current_path).to eq("/mechanics/#{smith.id}")
    expect(page).to have_content(fahrenheit.name)
  end
end