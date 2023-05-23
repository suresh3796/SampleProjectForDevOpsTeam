Feature: facebook page validation

  @fb1
  Scenario: open facebook page
    Given open facebook login page
    Then facebook login page should be opened

  Scenario Outline: Enter login details
    Given open facebook login page
    And input invalid "<username>" "<password>"
    When click on login button
    Examples:
    |username|password|
    |test|test|

  Scenario: Click on forget password link
    Given open facebook login page
    Then click on forget password link
    Then verify forget password page opened

  Scenario: Click on create page
    Given open facebook login page
    Then click on create page
    Then create a page should open

