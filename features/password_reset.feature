Feature: Password Reset
  As a forgetful user
  I want to reset my password
  So that I can still use my account, even if I've forgotten my password

  Scenario: Successful Reset Using Email
    Given a user named "zeke" with password "T0o|-|arD" exists
    And I am logged out
    When I submit a password reset for "zeke@example.com"
    And I follow the password reset link from my email
    And I fill in "password_reset_password" with "cheezyfries"
    And I press "Set my password"
    And I log out
    And I log in as "zeke" with password "cheezyfries"
    Then I should be on the homepage

  Scenario: Successful Reset Using Handle
    Given a user named "zeke" with password "T0o|-|arD" exists
    And I am logged out
    When I submit a password reset for "zeke"
    And I follow the password reset link from my email
    And I fill in "password_reset_password" with "cheezyfries"
    And I press "Set my password"
    And I log out
    And I log in as "zeke" with password "cheezyfries"
    Then I should be on the homepage
