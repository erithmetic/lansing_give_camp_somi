Given /I am logged in as "(.+)" with password "(.+)"/ do |username, password|
  When("I go to the sign-in page")
  When("I fill in \"session_email\" with \"#{handle}@example.com\"")
  When("I fill in \"session_password\" with \"#{password}\"")
  When("I press \"Log in\"")
end

Given /I am logged out/ do   # too many logs!
  When("I go to /sign-out")
end

When /I log out/ do
  When("I go to /sign-out")
end

When /I log in as "(.+)" with password "(.+)"/ do |handle, password|
  When("I go to the sign-in page")
  When("I fill in \"session_email\" with \"#{handle}@example.com\"")
  When("I fill in \"session_password\" with \"#{password}\"")
  When("I press \"Log in\"")
end
