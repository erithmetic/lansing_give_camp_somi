class Event < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_and_belongs_to_many :time_blocks

  def time
    date.strftime("%H:%M:%S")
  end
end
