class AddForeignKeysToMovies < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :movies, :directors
    add_foreign_key :movies, :writers
  end
end
