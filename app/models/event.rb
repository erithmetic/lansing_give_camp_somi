class Event < ActiveRecord::Base
	has_and_belongs_to_many :users

  def time
    date.strftime("%H:%M:%S")
  end
end
