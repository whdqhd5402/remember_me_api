# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{
  email: 'whdqhd5402@gmail.com',
  name: '박종봉',
  password: '123123',
  password_confirmation: '123123'
  },
  {
  email: '784wldnd@gmail.com',
  name: '최지웅',
  password: '123123',
  password_confirmation: '123123'
  },
  {
  email: 'rlaehddn1991@gmail.com',
  name: '김동우',
  password: '123123',
  password_confirmation: '123123'
  },
  {
  email: 'bumontproject@gmail.com',
  name: '이희남',
  password: '123123',
  password_confirmation: '123123'
  },
  {
  email: 'jckmm@naver.com',
  name: '고민철',
  password: '123123',
  password_confirmation: '123123'
  },
  {
  email: 'shaellina2@gmail.com',
  name: '임한솔',
  password: '123123',
  password_confirmation: '123123'
  }]
)

Trip.create([{
    title: '도쿄 여행',
    description: '',
    region: '일본 도쿄',
    start: '2017-01-01T00:00',
    end: '2017-01-10T00:00',
    user_id: 1
  },
  {
    title: '고등학교 친구들 여행',
    description: '',
    region: '부산',
    start: '2017-03-01T00:00',
    end: '2017-03-10T00:00',
    user_id: 1
  },
  {
    title: '제주도 여행',
    description: '',
    region: '제주도',
    start: '2017-03-01T00:00',
    end: '2017-03-10T00:00',
    user_id: 1
  },
  {
    title: '재수 친구들 여행',
    description: '',
    region: '부산',
    start: '2017-03-01T00:00',
    end: '2017-03-10T00:00',
    user_id: 1
  },
  {
    title: '내일로 1',
    description: '',
    region: '한국',
    start: '2017-03-01T00:00',
    end: '2017-03-10T00:00',
    user_id: 1
  },
  {
    title: '내일로 2',
    description: '',
    region: '한국',
    start: '2017-03-01T00:00',
    end: '2017-03-10T00:00',
    user_id: 1
  },
  {
    title: '유럽 여행',
    description: '',
    region: '유럽',
    start: '2017-03-01T00:00',
    end: '2017-03-10T00:00',
    user_id: 1
  },
  {
    title: '제주도 게스트 하우스',
    description: '',
    region: '제주도',
    start: '2017-03-01T00:00',
    end: '2017-03-10T00:00',
    user_id: 1
  },
  {
    title: '후쿠오카 여행',
    description: '',
    region: '일본 후쿠오카',
    start: '2017-03-01T00:00',
    end: '2017-03-10T00:00',
    user_id: 1
  },
  {
    title: '첫 번째 여행',
    description: '',
    region: '강화도',
    start: '2017-11-09T00:00',
    end: '2017-11-10T00:00',
    user_id: 1
  },
  {
    title: '사가 여행',
    description: '',
    region: '일본 사가',
    start: '2018-02-01T00:00',
    end: '2018-02-10T00:00',
    user_id: 1
  },
  {
    title: '코타키나발루 여행',
    description: '',
    region: '코타키나발루',
    start: '2018-08-01T00:00',
    end: '2018-08-10T00:00',
    user_id: 1
  }]
)
