class CreateDirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :directors do |t|
      t.string :name, null: false
      t.string :surname, null: false

      t.timestamp
    end
  end
end
