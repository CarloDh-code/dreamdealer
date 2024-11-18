class CreateDreams < ActiveRecord::Migration[7.1]
  def change
    create_table :dreams do |t|
      t.string :title
      t.text :description
      t.string :category
      t.float :price_per_night
      t.integer :age_limit
      t.integer :number_of_roles
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
