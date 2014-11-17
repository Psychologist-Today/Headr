class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
