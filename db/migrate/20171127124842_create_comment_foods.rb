class CreateCommentFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_foods do |t|
      t.references :user, foreign_key: true
      t.references :food, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
