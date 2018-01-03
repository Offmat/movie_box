module DurationHelper
  def format_duration(duration)
    duration ? Time.at(duration*60).utc&.strftime("%H:%M") : nil
  end
end
