class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.integer :subseq,      null: false
      t.string :name,         null: false, default: ""
      t.string :destination,  null: false, default: ""
      t.text :memo
      t.datetime :start
      t.datetime :end
      t.references :day, foreign_key: true

      t.timestamps
    end
  end
end
