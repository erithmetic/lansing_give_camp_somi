module EventsHelper
	def event_title(event)
		if event.full?
			return "<h3 class='full'>#{ link_to event.title, event }</h3>"	
		else
			return "<h3>#{ link_to event.title, event }</h3>"
		end
	end

  def event_volunteers(event)
    total = event.total_volunteers
    max_volunteers = event.maximum_volunteers || 0
  	num_needed = max_volunteers - total
  	
  	if event.full?
      return total
  	else
      return "#{total} (#{num_needed} more needed)"
  	end
  end

  def event_date(event)
    return 'TBA' if event.date.nil?

    date_string = event.date.strftime("%I:%M %p")
    return date_string if event.number_of_hours.nil?

  	later_date = event.date + event.number_of_hours.hours
    later_date_string = later_date.strftime("%I:%M %p")
    hours = pluralize(event.number_of_hours, 'hour')
    "#{date_string} - #{later_date_string} ( #{hours} )" 
  end
end
