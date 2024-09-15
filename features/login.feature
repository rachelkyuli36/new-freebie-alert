Feature: Login when account already exists

  As a student user
  So that I can log in to my own account

Background: users have been added to database

  Given the following users exist:
  | username | email                | password | email_confirmed |
  | testing  | testing@columbia.edu | testing  | true            |
  | rchung   | rchung@columbia.edu  | rchung   | true            |

  And I am on the login page

Scenario: successful login
    Given a valid user
    When I go to the login page
    And I fill in "Email" with "rchung@columbia.edu"
    And I fill in "Password" with "rchung"
    And I press "Log in"
    Then I should see "Welcome, rchung"

Scenario: unsuccessful login
    Given a valid user
    When I go to the login page
    And I fill in "Email" with "random@columbia.edu"
    And I fill in "Password" with "random"
    And I press "Log in"
    Then I should see "Invalid email/password combination"