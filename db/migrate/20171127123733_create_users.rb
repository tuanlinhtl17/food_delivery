class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :usertype
      t.string :username
      t.string :password_digest
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
