class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.date :release_date
      t.time :duration
      t.text :info
      t.text :genres, array: true, default: []
      t.references :director
      t.references :writer
      t.text :countries, array: true, default: []

      t.timestamps
    end
  end
end
