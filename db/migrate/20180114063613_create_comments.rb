class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user,foreigh_key: true
      t.references :food,foreigh_key: true
      t.timestamps
    end
  end
end
