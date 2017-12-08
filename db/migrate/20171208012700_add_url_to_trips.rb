class AddUrlToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :thumb, :string
  end
end
