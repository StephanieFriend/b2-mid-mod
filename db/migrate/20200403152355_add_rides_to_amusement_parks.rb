class AddRidesToAmusementParks < ActiveRecord::Migration[5.1]
  def change
    add_reference :amusement_parks, :rides, foreign_key: true
  end
end
