class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description
      t.string :region
      t.datetime :start
      t.datetime :end
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
