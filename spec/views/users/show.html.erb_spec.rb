require 'spec_helper'

describe "/users/show.html.erb" do
  include UsersHelper
  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :email => "value for email",
      :name => "value for name",
      :phone => "value for phone",
      :address1 => "value for address1",
      :address2 => "value for address2",
      :city => "value for city",
      :state => "value for state",
      :zip => "value for zip"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/value\ for\ address1/)
    response.should have_text(/value\ for\ address2/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/value\ for\ zip/)
  end
end
