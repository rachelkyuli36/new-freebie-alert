# Add a declarative step here for populating the DB with movies.

Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Event.create(:title => event['title'], :freebie => event['freebie'], :event_date => event['event_date'])
  end
  #pending "Fill in this step in movie_steps.rb"
end

Then /(.*) seed events should exist/ do | n_seeds |
  expect(Event.count).to eq n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following freebies: PG, G, R"
#  "When I check the following freebies: G"

When /I (un)?check the following types: (.*)/ do |uncheck, freebies_list|
  # HINT: use String#split to split up the freebie_list, then
  #   iterate over the freebies and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  freebies = freebies_list.split(', ')
  freebies.each do |freebie|
    uncheck ? uncheck(freebie) : check(freebie)
  end
end

# Part 2, Step 3
Then /^I should (not )?see the following events: (.*)$/ do |no, event_list|
  # Take a look at web_steps.rb Then /^(?:|I )should see "([^"]*)"$/
  events = event_list.split(', ')
  events.each do |event|
    if no 
      expect(page).not_to have_content(event)
    else
      expect(page).to have_content(event)
    end
  end
end

Then /I should see all the events/ do
  # Make sure that all the movies in the app are visible in the table
  expect(page).to have_selector("tr", count: Event.count + 1)
end

### Utility Steps Just for this assignment.

Then /^debug$/ do
  # Use this to write "Then debug" in your scenario to open a console.
   require "byebug"; byebug
  1 # intentionally force debugger context in this method
end

Then /^debug javascript$/ do
  # Use this to write "Then debug" in your scenario to open a JS console
  page.driver.debugger
  1
end


Then /complete the rest of of this scenario/ do
  # This shows you what a basic cucumber scenario looks like.
  # You should leave this block inside movie_steps, but replace
  # the line in your scenarios with the appropriate steps.
  fail "Remove this step from your .feature files"
end

Then /the event date of "(.*)" should be "(.*)"/ do |t, d|
  expect Event.find_by_title(t).event_date == d
end

Then /the type of "(.*)" should be "(.*)"/ do |event, type|
  expect Event.find_by_title(event).freebie == type
end