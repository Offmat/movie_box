class CrateMoviesWriters < ActiveRecord::Migration[5.1]
  def change
    create_table :movies_writers do |t|
      t.references :movie, foreign_key: true
      t.references :writer, foreign_key: true
      t.index [:movie_id, :writer_id], unique: true

      t.timestamps
    end
  end
end
