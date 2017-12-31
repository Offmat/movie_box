class ChangeDurationToBigint < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :durationtemp, :bigint

    Movie.all.each do |movie|
      movie.durationtemp = movie.duration[0..1].to_i*60 + movie.duration[3..4].to_i if movie.duration
      movie.save
    end
  end
end
