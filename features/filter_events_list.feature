Feature: display list of events filtered by type of free stuff

  As a student user
  So that I can quickly browse for the type of stuff I want
  I want to see events matching the type of stuff I want

Background: events have been added to database

  Given the following events exist:
  | title                        | freebie  | event_date |
  | Waterbottles on Lerner Ramps | MERCH   | 2020-10-19 |
  | Mochi Mingle                 | FOOD    | 2022-11-20 |
  | Pojangmacha                  | FOOD    | 2022-11-03 |

  And  I am on the FreebieAlert home page
  Then 3 seed events should exist

Scenario: restrict to events with type "MERCH"
  Given I check the following types: MERCH
  And I uncheck the following types: FOOD, OTHER
  And I press "Refresh"
  Then I should see the following events: Waterbottles on Lerner Ramps
  Then I should not see the following events: Mochi Mingle, Pojangmacha

Scenario: all types selected
  Given I check the following types: FOOD, MERCH, OTHER
  Then I should see all the events
