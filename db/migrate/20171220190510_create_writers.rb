class CreateWriters < ActiveRecord::Migration[5.1]
  def change
    create_table :writers do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.index [:name, :surname], unique: true

      t.timestamp
    end
  end
end
