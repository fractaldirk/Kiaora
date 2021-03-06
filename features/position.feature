Feature: Creating a position
Given I am on the homepage
And I want to create a new position
When I follow create new position
Then I should be able to create a position

  Scenario: creating a position
    Given I am on the homepage
    Then I should see "Hello World!"
    When I follow "Create new position"
    Then I should see "New position"
    And I fill in "Job title" with "Superman"
    And I press "Create position"
    Then I should see "Position was successfully created"
    And I should see "Job title"
    And I should see "Superman"
    When I follow "Back"
    Then I should see "Hello World!"

  Scenario: adding competencies
    Given I am on the homepage
    When I follow "Superman"
    Then I should see "Job description"
    When I follow "Edit"
    And I select "Define competency" with "" 
