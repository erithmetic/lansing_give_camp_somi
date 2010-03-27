Feature: Profile save
	As a user
	I want to save my profile
	
	Scenario: Save a New Profile
    Given I am logged in as an existing user with email "meredith@example.com" and password "test"
		When I visit the user profile page for "meredith@example.com" 
		And I fill in "name" with "Meredith"
		And I fill in "address1" with "123 Main St."
		And I fill in "city" with "Lansing"
		And I fill in "state" with "MI"
		And I fill in "zip" with "90210"
		And I press "update"
		Then I should be on user profile page for "meredith@example.com"
		And I should see "Email: meredith@example.com"
