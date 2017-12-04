class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email,          null: false, default: ""
      t.string :name,           null: false, default: ""
      t.string :password,       null: false, default: ""
      t.integer :sign_in_count, null: false, default: 0

      t.timestamps null: false
    end
  end
end
