class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :title,        null: false, default: ""
      t.text :description
      t.string :region
      t.datetime :start,      null: false
      t.datetime :end,        null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
