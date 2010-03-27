require 'spec_helper'

describe "/users/index.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :email => "value for email",
        :name => "value for name",
        :phone => "value for phone",
        :address1 => "value for address1",
        :address2 => "value for address2",
        :city => "value for city",
        :state => "value for state",
        :zip => "value for zip"
      ),
      stub_model(User,
        :email => "value for email",
        :name => "value for name",
        :phone => "value for phone",
        :address1 => "value for address1",
        :address2 => "value for address2",
        :city => "value for city",
        :state => "value for state",
        :zip => "value for zip"
      )
    ]
  end

  it "renders a list of users" do
    render
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for phone".to_s, 2)
    response.should have_tag("tr>td", "value for address1".to_s, 2)
    response.should have_tag("tr>td", "value for address2".to_s, 2)
    response.should have_tag("tr>td", "value for city".to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
    response.should have_tag("tr>td", "value for zip".to_s, 2)
  end
end
