class AddFavoriteToDream < ActiveRecord::Migration[7.1]
  def change
    add_column :dreams, :fav_status, :boolean, default: false
  end
end
