Feature: Add an event post

   As a student user
   So that I can add an event post
   I want to be able to create a new event post

 Background: I am on the home page 

  Given I am on the FreebieAlert home page

 Scenario: change event date of existing event
   When I follow "Add new event"
   And I fill in "Title" with "Beach Ball Giveaway at Ferris"
   And I select "MERCH" from "Type"
   And I fill in "Time of Event" with "3 pm"
   And I fill in "Image" with "https://lh3.googleusercontent.com/D_KeOAlkL7DOC4RxjVKDxr8a_Ii4T2pcxfAXjebnYgV7-NiIJ6o4M9mTjPoauK_9V6M=w2400"
   And I press "Save Changes"
   Then I should see "Beach Ball Giveaway at Ferris"