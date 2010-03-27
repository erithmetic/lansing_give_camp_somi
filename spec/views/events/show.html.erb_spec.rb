require 'spec_helper'

describe "/events/show.html.erb" do
  include EventsHelper
  before(:each) do
    assigns[:event] = @event = stub_model(Event,
      :title => "value for title",
      :description => "value for description",
      :location => "value for location",
      :number_of_hours => 
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ location/)
    response.should have_text(//)
  end
end
