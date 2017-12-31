class SwitchDurationWithDurationtemp < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :duration
    rename_column :movies, :durationtemp, :duration
  end
end
