class AddNotNullToWriters < ActiveRecord::Migration[5.1]
  def change
    change_column_null :writers, :name, false
    change_column_null :writers, :surname, false
  end
end
