class AddNotNullToDirectors < ActiveRecord::Migration[5.1]
  def change
    change_column_null :directors, :name, false
    change_column_null :directors, :surname, false
  end
end
