class CreateOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :opinions do |t|
      t.references :user, foreign_key: true, null: false
      t.references :movie, foreign_key: true, null: false
      t.integer :score, limit: 1
      t.text :comment
      t.index [:user_id, :movie_id], unique: true

      t.timestamps
    end
  end
end
