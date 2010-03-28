module EventsHelper
	def eventTitle(event)
		if event.full?
			return "<h3 class='full'>#{ link_to event.title, event }</h3>"	
		else
			return "<h3>#{ link_to event.title, event }</h3>"
		end
	end

end
