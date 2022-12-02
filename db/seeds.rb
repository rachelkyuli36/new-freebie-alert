# title, event_date, release_date, date_posted_type

events = [
  { title: 'Waterbottles on Lerner Ramps', freebie: 'MERCH', event_date: '2020-10-20', event_time: '6:00-7:00PM', affiliation: 'CCSC', image: "https://lh4.googleusercontent.com/-tVQehw282ah4VX9vUQ-hMi7t1fa9W8Sg08-v5lZP9vvyH6hJVy6ovIOQ91VAfCZA6M=w2400"},
  { title: 'Mochi Mingle', freebie: 'FOOD', event_date: '2022-11-20', event_time: '4:00-5:00PM', affiliation: 'TASA', image: "https://lh5.googleusercontent.com/C75sNxWCzMEl-FIVYfD0O7KK1QfT9GhhVY4wlljW99UBY7qqS26GxAtjqJ2vQKFPLOU=w2400"},
  { title: 'Pojangmacha', freebie: 'FOOD', event_date: '2022-11-03', event_time: '5:30-8:30PM', affiliation: 'KSA', image: "https://lh4.googleusercontent.com/E_lzmeTuTaeKiHipPjfI4w3QtWd-FNe9nj6XgI1r16NUTOKyrTvJcCj09Vl_w2C4IW4=w2400"},
]

events.each do |event|
  Event.create!(event)
end

users = [
  { username: 'testing', password: 'testing', email: 'testing@columbia.edu'},
  { username: 'rchung', password: 'rchung', email: 'rchung@columbia.edu'}
]

users.each do |user|
  User.create!(user)
end

Like.create(user: User.first(), event: Event.first())
Like.create(user: User.first(), event: Event.last())
Like.create(user: User.last(), event: Event.last())