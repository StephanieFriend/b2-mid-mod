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
  end
end


#  Story 3
#  As a user,
#       When I go to a mechanics show page
#  I see their name, years of experience, and names of all rides they’re working on
#
#
#
#  And I also see a form to add a ride to their workload
#  When I fill in that field with an id of an existing ride and hit submit
#  I’m taken back to that mechanics show page
#  And I see the name of that newly added ride on this mechanics show page
#
#  Ex:
#
#      Mechanic: Kara Smith
#  Years of Experience: 11
#
#  Current rides they’re working on:
#                                    The Frog Hopper
#  Fahrenheit
#  The Kiss Raise
#
#  Add a ride to workload:
#                    _pretent_this_is_a_textfield_
#  Submit
