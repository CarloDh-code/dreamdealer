class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :dream, null: false, foreign_key: true
      t.float :rating
      t.text :comment

      t.timestamps
    end
  end
end
