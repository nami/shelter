module ApplicationHelper
  def custom_format(date)
    Time.zone = "Japan"

    if date == Date.today
      "Today"
    elsif date == Date.yesterday
      "Yesterday"
    elsif (date > Date.today - 7) && (date < Date.yesterday)
      date.strftime("%A")
    else
      date.strftime("%B %-d")
    end
  end
end
