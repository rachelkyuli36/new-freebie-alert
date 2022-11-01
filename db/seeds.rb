
# title, event_date, release_date, date_posted_type

events = [
  { title: 'Waterbottles on Lerner Ramps', freebie: 'MERCH', event_date: '2020-10-20', event_time: '6:00-7:00PM', affiliation: 'CCSC'},
  { title: 'Mochi Mingle', freebie: 'FOOD', event_date: '2022-11-20', event_time: '4:00-5:00PM', affiliation: 'TASA'},
  { title: 'Pojangmacha', freebie: 'FOOD', event_date: '2022-11-03', event_time: '5:30-8:30PM', affiliation: 'KSA'},
]

events.each do |event|
  Event.create!(event)
end
