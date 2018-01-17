class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|

      t.references :user, foreigh_key: true
      t.references :food, foreigh_key: true
      t.float :rating

      t.timestamps
    end
  end
end
