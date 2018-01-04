class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true, null: false
      t.string :password_hash, null: false
      t.string :password_salt, null: false

      t.timestamps null: false
    end
  end
end
