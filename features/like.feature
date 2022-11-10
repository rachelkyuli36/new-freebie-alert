Feature: be able to like a post

  As a student user
  So that I can that show I like a post

Background: events have been added to database

  Given the following events exist:
  | title                        | freebie  | event_date |
  | Waterbottles on Lerner Ramps | MERCH   | 2020-10-19 |
  | Mochi Mingle                 | FOOD    | 2022-11-20 |
  | Pojangmacha                  | FOOD    | 2022-11-03 |

  And  I am on the FreebieAlert home page
  Then 3 seed events should exist