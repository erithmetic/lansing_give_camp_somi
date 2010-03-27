require 'spec_helper'

describe "/events/edit.html.erb" do
  include EventsHelper

  before(:each) do
    assigns[:event] = @event = stub_model(Event,
      :new_record? => false,
      :title => "value for title",
      :description => "value for description",
      :location => "value for location",
      :number_of_hours => 
    )
  end

  it "renders the edit event form" do
    render

    response.should have_tag("form[action=#{event_path(@event)}][method=post]") do
      with_tag('input#event_title[name=?]', "event[title]")
      with_tag('input#event_description[name=?]', "event[description]")
      with_tag('input#event_location[name=?]', "event[location]")
      with_tag('input#event_number_of_hours[name=?]', "event[number_of_hours]")
    end
  end
end
