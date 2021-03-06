Feature: Adding a competency to the dictionary
Given I am on the GPI_homepage
And I want to add a new competency
When I follow create new competency
Then I should be able to create a competency

  Scenario: adding a competency
    Given I am on the GPI_homepage
    Then I should see "Hello GPI world!"
    When I follow "Competency dictionary"
    Then I should see "Manage dictionary"
    When I follow "Add competency"
    Then I should see "New competency"
    And I fill in "Competency english" with "Knowledge in flying"
    And I press "Add competency"
    Then I should see "Competency was successfully created"
    And I should see "Competency english"
    And I should see "Knowledge in flying"
    When I follow "Back"
    Then I should see "Manage dictionary"
    When I follow "Back to homepage"
    Then I should see "Hello GPI world!"
