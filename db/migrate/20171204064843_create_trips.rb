class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :region
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
