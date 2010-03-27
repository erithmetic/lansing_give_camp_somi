Given /a user named "(.+)" with password "(.+)" exists/ do |email, password|
  @email = email
  When("I go to the signup page")
  When('I fill in "user_email" with "' + email + '@example.com"')
  When('I fill in "user_password" with "' + password + '"')
  When('I press "Sign me up"')
end

Given /a user with email "(.+)" exists/ do |email|
  Factory.create(:user, :email => email)
end

Given /I am logged in as an existing user named "(.+)" with password "(.+)"/ do |email, password|
  Given("a user named \"#{email}\" with password \"#{password}\" exists")
end

When /I edit my profile/ do
  When("I go to /users/#{@email}/edit")
end

Then /the user edit sould have been successful/ do
  me = Person.find_by_email('newemail')
  me.email.should == 'newemail@example.com'
end
