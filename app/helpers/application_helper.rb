module ApplicationHelper
  def time_options
    (0...24).map do |hour|
      format("%02d:%02d %s", (hour % 12 == 0 ? 12 : hour % 12), 00, hour < 12 ? "AM" : "PM")
    end
  end
end
