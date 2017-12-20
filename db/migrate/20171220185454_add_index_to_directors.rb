class AddIndexToDirectors < ActiveRecord::Migration[5.1]
  def change
    add_index :directors, [:name, :surname], unique: true
  end
end
