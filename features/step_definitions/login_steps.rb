Given /I am logged in as "(.+)" with password "(.+)"/ do |email, password|
  When("I go to the sign-in page")
  When("I fill in \"user_session_email\" with \"#{email}\"")
  When("I fill in \"user_session_password\" with \"#{password}\"")
  When("I press \"Log in\"")
end

Given /I am logged out/ do   # too many logs!
  When("I go to /sign-out")
end

When /I log out/ do
  When("I go to /sign-out")
end

When /I log in as "(.+)" with password "(.+)"/ do |email, password|
  When("I go to the sign-in page")
  When("I fill in \"user_session_email\" with \"#{email}\"")
  When("I fill in \"user_session_password\" with \"#{password}\"")
  When("I press \"Log in\"")
end
