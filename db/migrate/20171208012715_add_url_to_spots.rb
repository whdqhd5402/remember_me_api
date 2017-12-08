class AddUrlToSpots < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :thumb, :string
  end
end
