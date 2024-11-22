class ChangePricePerNightToIntegerInDreams < ActiveRecord::Migration[7.1]
  def change
    change_column :dreams, :price_per_night, :integer
  end
end
