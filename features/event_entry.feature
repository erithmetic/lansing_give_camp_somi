Feature: Event entry
  As a site manager
  I want to manage events
  So that people can know about them

  Scenario: Creating a New Event
    Given I am logged in as an existing user with email "meredith@somi.org" and password "test"
    When I go to the new event page
    And I fill in "title" with "Swim Meet"
    And I fill in "description" with "Swimming events at MSU"
    And I fill in "location" with "123 MSU Drive, East Lansing, MI"
    And I fill in "event_number_of_hours" with "8"
    And I fill in "event_minimum_volunteers" with "20"
    And I fill in "event_maximum_volunteers" with "30"
    And I press "create"
    Then I should be on the events page
    And I should see "Swim Meet"
