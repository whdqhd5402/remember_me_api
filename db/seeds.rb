# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{
  email: 'whdqhd5402@gmail.com',
  name: 'JB',
  password: '123123'
  },
  {
  email: '784wldnd@gmail.com',
  name: 'JW',
  password: '123123'
  }]
)

Trip.create([{
    title: '1번째 여행',
    region: '서울',
    start: '2017-01-01T00:00',
    end: '2017-01-10T00:00'
  },
  {
    title: '2번째 여행',
    region: '부산',
    start: '2017-03-01T00:00',
    end: '2017-03-10T00:00'
  },
  {
    title: '3번째 여행',
    region: '강화도',
    start: '2017-11-09T00:00',
    end: '2017-11-10T00:00'
  }]
)
