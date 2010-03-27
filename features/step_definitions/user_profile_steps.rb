When /I visit user profile page for "(.+)"/ do |email|
	userid = User.find_by_email(email).id
	When("I go to /users/#{userid}/edit")
end
