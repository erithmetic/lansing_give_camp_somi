require 'spec_helper'

describe "/events/index.html.erb" do
  include EventsHelper

  before(:each) do
    assigns[:events] = [
      stub_model(Event,
        :title => "value for title",
        :description => "value for description",
        :location => "value for location",
        :number_of_hours => 
      ),
      stub_model(Event,
        :title => "value for title",
        :description => "value for description",
        :location => "value for location",
        :number_of_hours => 
      )
    ]
  end

  it "renders a list of events" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for location".to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
  end
end
