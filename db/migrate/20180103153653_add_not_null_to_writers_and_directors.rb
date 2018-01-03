class AddNotNullToWritersAndDirectors < ActiveRecord::Migration[5.1]
  def change
    change_column_null :movies_directors, :movie_id, false
    change_column_null :movies_directors, :director_id, false
    change_column_null :movies_writers, :movie_id, false
    change_column_null :movies_writers, :writer_id, false
  end
end
