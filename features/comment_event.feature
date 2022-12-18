Feature: Comment on an event

  As a student user
  So that I can comment on event

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

Scenario: Add comment to an existing event
  When I go to the show page for "Mochi Mingle"
  And I fill in "Name" with "Youngseo"
  And I fill in "Comment" with "so excited!"
  And I press "Leave a reply"
  Then I should see "so excited!"
  Then I should see "1 Comments"

Scenario: Delete comment from an event
  When I go to the show page for "Mochi Mingle"
  And I fill in "Name" with "Youngseo"
  And I fill in "Comment" with "so excited!"
  And I press "Leave a reply"
  Then I should see "so excited!"
  Then I should see "Delete"
  And I follow "Delete"
  Then I should see "0 Comments"