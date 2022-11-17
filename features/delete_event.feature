Feature: Delete an event

  As a student user
  So that I can edit an event
  I want to be able to change the information of a posted event

Background: events have been added to database

  Given the following events exist:
  | title                        | freebie  | event_date |
  | Waterbottles on Lerner Ramps | MERCH   | 2020-10-19 |
  | Mochi Mingle                 | FOOD    | 2022-11-20 |
  | Pojangmacha                  | FOOD    | 2022-11-03 |
  
  And  I am on the FreebieAlert home page
  Then 3 seed events should exist

Scenario: change event date of existing event
  When I go to the show page for "Mochi Mingle"
  And I follow "Delete"
  Then I should see "Event 'Mochi Mingle' deleted."