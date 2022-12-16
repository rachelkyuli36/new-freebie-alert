Feature: Create new account

  As a student user
  So that I can create a new account

Background: users have been added to database

  Given the following users exist:
  | username | email                | password | email_confirmed |
  | testing  | testing@columbia.edu | testing  | true            |
  | rchung   | rchung@columbia.edu  | rchung   | true            |

  And I am on the login page
  And I follow "Sign up now!"

Scenario: email is already used by another account
    Given I am on the create new account page
    And I fill in "Email" with "rchung@columbia.edu"
    And I fill in "Username" with "rchung123"
    And I fill in "Password" with "rchung123"
    And I press "Create Account"
    Then I should see "Email is already associated with another account. Please try creating another account."

Scenario: username is already used by another account
    Given I am on the create new account page
    And I fill in "Email" with "rkc2134@columbia.edu"
    And I fill in "Username" with "rchung"
    And I fill in "Password" with "rchung"
    And I press "Create Account"
    Then I should see "Username is already associated with another account. Please try creating another account."

Scenario: email is invalid
    Given I am on the create new account page
    And I fill in "Email" with "test@gmail.com"
    And I fill in "Username" with "test"
    And I fill in "Password" with "test"
    And I press "Create Account"
    Then I should see "Email is not valid. Please try creating another account with a columbia/barnard email."

Scenario: successfully created an account but need to confirm the email address
    Given I am on the create new account page
    And I fill in "Email" with "rkc2134@columbia.edu"
    And I fill in "Username" with "rkc2134"
    And I fill in "Password" with "rkc2134"
    And I press "Create Account"
    Then I should see "Please confirm your email address to continue"
