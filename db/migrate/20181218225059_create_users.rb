class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.string :zip_code
      t.string :country
      t.string :phone_number
      t.string :email
      t.string :password_digest
      t.index ['email'], name: 'index_users_on_email'

      t.timestamps
    end
  end
end
