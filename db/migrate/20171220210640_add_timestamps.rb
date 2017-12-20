class AddTimestamps < ActiveRecord::Migration[5.1]
  def up
    change_table :directors do |t|
      t.timestamps
    end
    change_table :writers do |t|
      t.timestamps
    end
  end
end
