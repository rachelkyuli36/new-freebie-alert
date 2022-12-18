# title, event_date, release_date, date_posted_type

events = [
  { owner: "rchung", title: 'Waterbottles on Lerner Ramps', freebie: 'MERCH', event_date: '2023-12-31', event_time: '6:00-7:00PM', affiliation: 'CCSC', image: "https://lh4.googleusercontent.com/-tVQehw282ah4VX9vUQ-hMi7t1fa9W8Sg08-v5lZP9vvyH6hJVy6ovIOQ91VAfCZA6M=w2400"},
  { owner: "rchung", title: 'Mochi Mingle', freebie: 'FOOD', event_date: '2023-1-20', event_time: '4:00-5:00PM', affiliation: 'TASA', image: "https://lh5.googleusercontent.com/C75sNxWCzMEl-FIVYfD0O7KK1QfT9GhhVY4wlljW99UBY7qqS26GxAtjqJ2vQKFPLOU=w2400"},
  { owner: "ruthl", title: 'Pojangmacha', freebie: 'FOOD', event_date: '2023-1-03', event_time: '5:30-8:30PM', affiliation: 'KSA', image: "https://lh4.googleusercontent.com/E_lzmeTuTaeKiHipPjfI4w3QtWd-FNe9nj6XgI1r16NUTOKyrTvJcCj09Vl_w2C4IW4=w2400"},
  { owner: "ruthl", title: 'FIFA Watch Party', freebie: 'FOOD', event_date: '2022-12-05', event_time: '2:00-4:00PM', affiliation: 'KSA', image: "https://lh3.googleusercontent.com/IiZy0HbP3nLfgjiUQWBMo9vFww9T75OSkYJM1GTzSTilcpheTL1HUINRm0T-Q_0J7EM=w2400"},
  { owner: "yslee", title: 'WiCS General Body Meeting', freebie: 'OTHER', event_date: '2022-11-10', event_time: '6:00-7:00PM', affiliation: 'WiCS', image: "https://lh4.googleusercontent.com/BRvVxkauWi9JnHfUd2dNs5twSEsYbhLvgKN1PxX8Wd-xSj1RUW7orDT1naE_HFQW77U=w2400"},
  { owner: "yslee", title: 'GS Raffle Event', freebie: 'OTHER', event_date: '2022-10-09', event_time: '1:00PM-2:00PM', affiliation: 'GSSC', image: 'https://lh6.googleusercontent.com/sI4VvXIi1vCF5_LObO5fFlZqojSgL2ptQfcSh4qSJZSlPeJfoHy8SIrLxbCYHVhnCCs=w2400'}
]

events.each do |event|
  Event.create!(event)
end

users = [
  { username: 'testing', password: 'testing', email: 'testing@columbia.edu'},
  { username: 'rchung', password: 'rchung', email: 'rchung@columbia.edu'},
  { username: 'ruthl', password: 'ruthl', email: 'ruthl@columbia.edu'},
  { username: 'yslee', password: 'yslee', email: 'yslee@columbia.edu'}
]

users.each do |user|
  User.create!(user)
end

Like.create(user: User.first(), event: Event.first())
Like.create(user: User.first(), event: Event.last())
Like.create(user: User.last(), event: Event.last())
