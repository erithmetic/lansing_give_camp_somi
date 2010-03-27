require 'spec_helper'

describe "/events/new.html.erb" do
  include EventsHelper

  before(:each) do
    assigns[:event] = stub_model(Event,
      :new_record? => true,
      :title => "value for title",
      :description => "value for description",
      :location => "value for location",
      :number_of_hours => 
    )
  end

  it "renders new event form" do
    render

    response.should have_tag("form[action=?][method=post]", events_path) do
      with_tag("input#event_title[name=?]", "event[title]")
      with_tag("input#event_description[name=?]", "event[description]")
      with_tag("input#event_location[name=?]", "event[location]")
      with_tag("input#event_number_of_hours[name=?]", "event[number_of_hours]")
    end
  end
end
