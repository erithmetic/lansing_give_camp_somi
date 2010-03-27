require 'spec_helper'

describe "/users/edit.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :new_record? => false,
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

  it "renders the edit user form" do
    render

    response.should have_tag("form[action=#{user_path(@user)}][method=post]") do
      with_tag('input#user_email[name=?]', "user[email]")
      with_tag('input#user_name[name=?]', "user[name]")
      with_tag('input#user_phone[name=?]', "user[phone]")
      with_tag('input#user_address1[name=?]', "user[address1]")
      with_tag('input#user_address2[name=?]', "user[address2]")
      with_tag('input#user_city[name=?]', "user[city]")
      with_tag('input#user_state[name=?]', "user[state]")
      with_tag('input#user_zip[name=?]', "user[zip]")
    end
  end
end
