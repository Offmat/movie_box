class AddNotNullContraintToUserIdInMovies < ActiveRecord::Migration[5.1]
  def change
    change_column_null :movies, :user_id, false
  end
end
