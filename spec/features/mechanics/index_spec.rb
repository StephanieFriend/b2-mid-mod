require 'rails_helper'

RSpec.describe 'As a user' do
  it 'I see a header saying All Mechanics' do

    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
  end

  it 'I can see a list of all mechanics names and their years of experience' do
    mills = Mechanic.new({name: 'Sam Mills',
                             years_of_experience: 10})
    smith = Mechanic.new({name: 'Kara Smith',
                             years_of_experience: 11})

    mills.save
    smith.save

    visit '/mechanics'

    expect(page).to have_content(mills.name)
    expect(page).to have_content("#{mills.years_of_experience.to_s} years of experience")
    expect(page).to have_content(smith.name)
    expect(page).to have_content("#{smith.years_of_experience} years of experience")
  end
end

