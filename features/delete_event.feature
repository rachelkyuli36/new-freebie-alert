Feature: Delete an event

  As a student user
  So that I can edit an event
  I want to be able to change the information of a posted event

Background: events have been added to database and am logged in

   Given the following users exist:
  | username | email                | password | email_confirmed |
  | testing  | testing@columbia.edu | testing  | true            |
  | rchung   | rchung@columbia.edu  | rchung   | true            |

  Given the following events exist:
  | title                        | freebie  | event_date |
  | Waterbottles on Lerner Ramps | MERCH   | 2020-10-19 |
  | Mochi Mingle                 | FOOD    | 2022-11-20 |
  | Pojangmacha                  | FOOD    | 2022-11-03 |
  
  Given I am on the login page
  And I am logged in with "Email":rchung@columbia.edu and "Password":rchung
  And I am on the FreebieAlert home page
  Then 3 seed events should exist

Scenario: change event date of existing event
  When I go to the show page for "Mochi Mingle"
  And I follow "Delete"
  Then I should see "Event 'Mochi Mingle' deleted."