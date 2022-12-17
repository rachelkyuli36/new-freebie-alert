Feature: Like an event

  As a student user
  So that I can edit an event
  I want to be able to change the information of a posted event

Background: events have been added to database and am logged in

   Given the following users exist:
  | username | email                | password |
  | testing  | testing@columbia.edu | testing  |
  | rchung   | rchung@columbia.edu  | rchung   |

  Given the following events exist:
  | title                        | freebie  | event_date | owner  |
  | Waterbottles on Lerner Ramps | MERCH    | 2020-10-19 | rchung |
  | Mochi Mingle                 | FOOD     | 2022-11-20 | rchung |
  | Pojangmacha                  | FOOD     | 2022-11-03 | rchung |
  
  Given I am on the login page
  And I am logged in with "Email":rchung@columbia.edu and "Password":rchung
  And I am on the FreebieAlert home page
  Then 3 seed events should exist

Scenario: Add like to an existing event
  When I go to the show page for "Mochi Mingle"
  And I press "Like"
  