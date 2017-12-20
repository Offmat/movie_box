class RemoveColumnsWiterDirector < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :director_id
    remove_column :movies, :writer_id
  end
end
