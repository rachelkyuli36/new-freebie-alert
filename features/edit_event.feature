Feature: Edit an event post

   As a student user
   So that I can edit an event post
   I want to be able to change the information of a posted event

 Background: events have been added to database

  Given the following events exist:
  | title                        | freebie  | event_date |
  | Waterbottles on Lerner Ramps | MERCH   | 2020-10-19 |
  | Mochi Mingle                 | FOOD    | 2022-11-20 |
  | Pojangmacha                  | FOOD    | 2022-11-03 |

 Scenario: change event date of existing event
   When I go to the edit page for "Mochi Mingle"
   And I select "OTHER" from "Type"
   And I press "Update Event"
   Then the type of "Mochi Mingle" should be "OTHER"

 Scenario: change image of existing event
   When I go to the edit page for "Mochi Mingle"
   And I fill in "Upload Image: Obtain direct image link from shareable google drive link" with "https://lh3.googleusercontent.com/D_KeOAlkL7DOC4RxjVKDxr8a_Ii4T2pcxfAXjebnYgV7-NiIJ6o4M9mTjPoauK_9V6M=w2400"
   And I press "Update Event"
   Then the image of "Mochi Mingle" should be "https://lh3.googleusercontent.com/D_KeOAlkL7DOC4RxjVKDxr8a_Ii4T2pcxfAXjebnYgV7-NiIJ6o4M9mTjPoauK_9V6M=w2400"
  