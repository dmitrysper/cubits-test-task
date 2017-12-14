@test_suite @login
Feature: Positive and negative login

  Background:
    Given I am on the Start page

  @positive_login_logout
  Scenario: As a registered Cubits user I should be able to log into the app with valid credentials and log out

    When I click on "Login" link
    Then I should see "Login" page

    When I enter valid e-mail address
     And I enter valid password
     And I click "Login" button
    Then I should see "Main" page
     And I should see that "Activity" tab is selected
     And I should see correct user name in the menu

    When I open user menu
     And I select "Logout" menu option
    Then I should see "Start" page
