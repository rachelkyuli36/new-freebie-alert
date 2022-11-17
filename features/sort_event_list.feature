Feature: display list of events sorted by different criteria

  As an student who wants free stuff
  So that I can quickly browse events based on my preferences
  I want to see events sorted by the date of the event

Background: movies have been added to database

  Given the following events exist:
  | title                        | freebie  | event_date |
  | Waterbottles on Lerner Ramps | MERCH   | 2020-10-19 |
  | Mochi Mingle                 | FOOD    | 2022-11-20 |
  | Pojangmacha                  | FOOD    | 2022-11-03 |

  And  I am on the FreebieAlert home page
  Then 3 seed events should exist

Scenario: sort movies in decreasing order of event date
  When I follow "Event Date"
  Then I should see "Mochi Mingle" before "Waterbottles on Lerner Ramps"
