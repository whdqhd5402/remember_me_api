class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.text :key

      t.timestamps
    end
  end
end
