class CrateMoviesDirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :movies_directors do |t|
      t.references :movie, foreign_key: true
      t.references :director, foreign_key: true
      t.index [:movie_id, :director_id], unique: true

      t.timestamps
    end
  end
end
