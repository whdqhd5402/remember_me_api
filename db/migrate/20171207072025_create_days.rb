class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.integer :seq,       null: false, default: ""
      t.string :alias
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
