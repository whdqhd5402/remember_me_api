# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Remember_Me API Document



### README

> Document에는 각각 API 를 사용하는 방법을 의미한다.
>
> URI, Method, Parameter, Return & Status Code 로 이루어져 있다.
>
> Parameter 와 Return 은 '이름 => 자료형' 으로 구성
>
> Parameter 와 Return 의 명명은 잘 지켜야 한다.
>
> Return 값은 Status Code에 따라 다른 값을 반환한다.
>
> [Http Status Code](https://ko.wikipedia.org/wiki/HTTP_%EC%83%81%ED%83%9C_%EC%BD%94%EB%93%9C) 를 참조
>
> 쉽게 나누자면
>
> 2xx : 성공 ( 끝 )
>
> 3xx : 리다이렉트 ( 무시 )
>
> 4xx : 내 문제 ( 내 잘못이니까 남탓 하지말기 )
>
> 5xx : 니 문제 ( 니 잘못이니까 빨리 찾아봐 )
>
>
>
> P.S.
>
> index는 사용하지말 것. page를 이용해서 가지고 올 것



## Contents

- User
- Trip
- Day
- Spot
- PhotoUploader



### User

- SignUp :

  > URI : http://localhost:3000/users/signup
  >
  > Method : Post
  >
  > Parameter :
  >
  > > name => string
  > >
  > > email => string
  > >
  > > password => string
  > >
  > > password_confirmation => string
  >
  > Return & Status Code :
  >
  > > 201 : None
  > >
  > > 500 : error
  >
  > Test :
  >
  > - parameter
  >
  > curl -d 'user[name]=JB&user[email]=whdqhd5402@gmail.com&user[password]=123123&user[password_confirmation]=123123' http://localhost:3000/users/signup
  >
  > ​
  >
  > curl -d 'user[name]=aglx91&user[email]=analogsoul91@gmail.com&user[password]=123123&user[password_confirmation]=123123' http://70.12.50.58:3000/users/signup

- SignIn :

  > URI : http://localhost:3000/users/signin
  >
  > Method : Post
  >
  > Parameter :
  >
  > > email => string
  > >
  > > password => string
  >
  > Return & Status Code :
  >
  > > 200 : token => string
  > >
  > > 500 : error
  >
  > Test :
  >
  > - parameter
  >
  > curl -d 'user[email]=whdqhd5402@gmail.com&user[password]=123123' http://localhost:3000/users/signin

- ~~SignOut~~ : Deprecated

  > URI : http://localhost:3000/users/signout
  >
  > Method : Delete
  >
  > Parameter : None
  >
  > Return & Status Code :
  >
  > > 204 : None
  > >
  > > 500 : error



### Trip

- Index :

  >URI : http://localhost:3000/trips
  >
  >Method : Get
  >
  >Parameter :
  >
  >> None
  >
  >Return & Status Code :
  >
  >> 200 : trips => array
  >>
  >> 500 : error
  >
  >Test :
  >
  >- ~~parameter~~ deprecated
  >
  >curl -XGET http://localhost:3000/trips?token=eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZXhwIjoxNTE1MTQxOTg0fQ.5fS8rsrHR_jU8_OeAHx2vHFTcUbtMXgHsu3HRUTqYGk
  >
  >- header
  >
  >curl -XGET -H 'token:eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZXhwIjoxNTE1MTQxOTg0fQ.5fS8rsrHR_jU8_OeAHx2vHFTcUbtMXgHsu3HRUTqYGk' http://localhost:3000/trips

- page :

  > URI : http://localhost:3000/trips/page/:page
  >
  > Method : Get
  >
  > Parameter :
  >
  > > page => integer
  >
  > Return  & Status Code :
  >
  > > 200 : trips => array( 10 )
  > >
  > > 406 :
  > >
  > > 500 : error
  >
  > Test :

- show :

  > URI : http://localhost:3000/trips/:id
  >
  > Method : Get
  >
  > Parameter :
  >
  > > id => integer
  >
  > Return  & Status Code :
  >
  > > 200 : trips => array( 10 )
  > >
  > > 406 :
  > >
  > > 500 : error
  >
  > Test :

- create :

  > URI : http://localhost:3000/trips
  >
  > Method : Post
  >
  > Parameter :
  >
  > > id => integer
  >
  > Return & Status Code :
  >
  > > 204 : None
  > >
  > > 500 : error
  >
  > Test :
  >
  > - ~~parameter~~ deprecated
  >
  > curl -d 'token=' http://localhost:3000/trips
  >
  > - header
  >
  > curl -XPOST -H 'token:token:eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZXhwIjoxNTE1MTQxOTg0fQ.5fS8rsrHR_jU8_OeAHx2vHFTcUbtMXgHsu3HRUTqYGk' http://localhost:3000/trips

- update :

  > URI : http://localhost:3000/trips/:id
  >
  > Method : Put, Patch
  >
  > Parameter :
  >
  > > token => string
  >
  > Return & Status Code :
  >
  > > 204 : None
  > >
  > > 500 : error
  >
  > Test :
  >
  > - header
  >
  > curl -XPUT -H 'token:token:eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZXhwIjoxNTE1MTQxOTg0fQ.5fS8rsrHR_jU8_OeAHx2vHFTcUbtMXgHsu3HRUTqYGk' http://localhost:3000/trips/1

- destroy :

  > URI : http://localhost:3000/trips/:id
  >
  > Method : Delete
  >
  > Parameter :
  >
  > > token => string
  >
  > Return & Status Code :
  >
  > > 204 : None
  > >
  > > 500 : error
  >
  > Test :
  >
  > - header
  >
  > curl -XDELETE -H 'token:token:eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZXhwIjoxNTE1MTQxOTg0fQ.5fS8rsrHR_jU8_OeAHx2vHFTcUbtMXgHsu3HRUTqYGk' http://localhost:3000/trips/1



###Day

- index :

  > URI : http://localhost:3000/trips/:tid/days
  >
  > Method : Get
  >
  > Parameter :
  >
  > > tid => integer
  >
  > Return & Status Code :
  >
  > > 204 : days => array
  >
  > Test :

- page :

  > URI : http://localhost:3000/trips/:tid/days/page/:page
  >
  > Method : Get
  >
  > Parameter :
  >
  > > tid => integer
  > >
  > > page => integer
  >
  > Return & Status Code :
  >
  > > 204 : days => array
  >
  > Test :

- create :

  > URI : http://localhost:3000/trips/:tid/days
  >
  > Method : Post
  >
  > Parameter :
  >
  > > tid => integer
  >
  > Return & Status Code :
  >
  > > 204 : days => array
  >
  > Test :

- show :

  > URI : http://localhost:3000/days/:did
  >
  > Method : Get
  >
  > Parameter :
  >
  > > did => integer
  >
  > Return  & Status Code :
  >
  > > 200 : trips => array( 10 )
  > >
  > > 406 :
  > >
  > > 500 : error
  >
  > Test :

- update :

  > URI : http://localhost:3000/days/:did
  >
  > Method : Put, Patch
  >
  > Parameter :
  >
  > > tid => integer
  >
  > Return & Status Code :
  >
  > > 204 : days => array
  >
  > Test :

- destroy :

  > URI : http://localhost:3000/days/:did
  >
  > Method : Delete
  >
  > Parameter :
  >
  > > tid => integer
  >
  > Return & Status Code :
  >
  > > 204 : days => array
  >
  > Test :

### Spot

- index :

  > URI : http://localhost:3000/trips/:tid/days/:did/spots
  >
  > Method : Get
  >
  > Parameter :
  >
  > > tid => integer
  > >
  > > did => integer
  >
  > Return & Status Code :
  >
  > > 204 : days => array
  >
  > Test :

- page :

  > URI : http://localhost:3000/trips/:tid/days/:did/spots/page/:page
  >
  > Method : Get
  >
  > Parameter :
  >
  > > tid => integer
  > >
  > > did => integer
  > >
  > > page => integer
  >
  > Return & Status Code :
  >
  > > 204 : days => array
  >
  > Test :

- create :

  > URI : http://localhost:3000/trips/:tid/days/:did/spots
  >
  > Method : Post
  >
  > Parameter :
  >
  > > tid => integer
  > >
  > > did => integer
  >
  > Return & Status Code :
  >
  > > 204 : days => array
  >
  > Test :

- show :

  > URI : http://localhost:3000/spots/:sid
  >
  > Method : Get
  >
  > Parameter :
  >
  > > sid => integer
  >
  > Return  & Status Code :
  >
  > > 200 : trips => array( 10 )
  > >
  > > 406 :
  > >
  > > 500 : error
  >
  > Test :

- update :

  > URI : http://localhost:3000/spots/:sid
  >
  > Method : Put, Patch
  >
  > Parameter :
  >
  > > sid => integer
  >
  > Return & Status Code :
  >
  > > 204 : days => array
  >
  > Test :

- destroy :

  > URI : http://localhost:3000/spots/:sid
  >
  > Method : Delete
  >
  > Parameter :
  >
  > > sid => integer
  >
  > Return & Status Code :
  >
  > > 204 : days => array
  >
  > Test :
