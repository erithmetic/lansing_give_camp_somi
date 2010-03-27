require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :email => "value for email",
      :name => "value for name",
      :phone => "value for phone",
      :address1 => "value for address1",
      :address2 => "value for address2",
      :city => "value for city",
      :state => "value for state",
      :zip => "value for zip"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
