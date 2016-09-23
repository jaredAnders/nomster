class AlterPlacesAddAverageRating < ActiveRecord::Migration
  def change
    add_column :places, :average_rating, :float
  end
end
