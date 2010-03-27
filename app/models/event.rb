class Event < ActiveRecord::Base
  def time
    date.strftime("%H:%M:%S")
  end
end
