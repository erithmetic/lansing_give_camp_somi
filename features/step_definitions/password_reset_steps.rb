When /I submit a password reset for "(.+)"/ do |email|
  When("I go to the password reset email page")
  When("I fill in \"password_reset_email\" with \"#{email}\"")
  When("I press \"Send reset email\"")
  @perishable_token = User.find_by_email(email).perishable_token
end

When /I follow the password reset link from my email/ do
  When("I go to /password_resets/#{@perishable_token}/edit")
end
