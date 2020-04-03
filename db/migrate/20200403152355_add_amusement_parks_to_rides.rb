class AddAmusementParksToRides < ActiveRecord::Migration[5.1]
  def change
    add_reference :rides, :amusement_parks, foreign_key: true
  end
end
