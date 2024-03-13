# Resturant Reservation System

## Introduction
The app is built by Model view controller methodology using Ruby on Rails. It consists of 4 data models representing users, restaurants, reservations and tables. The system allows user to book reservations for a restaurant within their operation hours in a minimum of 1 hour time slot and the max duration they can book is determined by the restaurant itself. Also, availability of a table of a restaurant is based on a given date.
 
## Allocation Strategy 
The idea is that the system will first need to generate all possible combinations of time slots based on restaurant’s business hours and max duration they permitted for each reservation. For example, if a restaurant operates from 14:00 to 18:00 with max allow stay duration of 2 hours, so it has 4 hours of operation time and potential booking slots for a table would be `[14, 15], [14, 16], [15, 16], [15, 17], [16, 17], [16, 18], [17, 18].` So if the max allow stay duration is 3 hours, the system will generate additional time slots of `[14, 17], [15, 18]`
Please note that if `[14, 17]`is reserved, `[14, 15], [14, 16], [15, 16], [15, 17], [16, 17]`  becomes unavailable for the table. 

The allocation strategy would be first come first serve and if one time slot is unavailable for a table it will try to find the same time slot for a different table until the restaurant is running of tables.  The system will then returns an error messaging saying no time slot is available for the chosen time range. 

## Testing methodology
Testing methodology of the system would be ensuring user can book any time slots if a table is 100% free from any bookings and certain time slots will no longer be options if there was a reservation that goes for a longer duration as mentioned in the above example. The system also needs to ensure that if there are other tables available on the restaurant it will try to book the user to a different if applicable rather than returning the unavailable time slot error.

## File structure explanation
`app/models`: business logic of the system 
`app/commands`: simple service helpers for controllers to serve the purpose of finding available time slot and conduct reserve operations.
`app/controllers`: endpoints to interact with the outside world.
`app/services`: service helper classes for controllers & models to find available time slot of tables. This is also where is the system allocates tables and determines if tables are available. 

## Limitations & Improvements
One potential improvement to the system would be using time zones to track & book reservations but at the same time, time zones can run into some tricky situations.

Another improvement to the system would be expanding the time slot from 1 hour to be 15 minutes basis so as an example, booking of 17:15 to 18:15 becomes possible. Due to the time limitations, I thought about doing it but figured best to implement the 1 hour approach. I do believe using the same algorithm would be fine because we just need to generate more time slots and making sure some time slots become unavailable if they are included in a reserved time slot to avoid conflicts. 

## Installation

run bundle install from the root repository of the project

```ruby
bundle install
```

Execute the following to create the databases:

    $ rails db:setup

Execute the following to initialize the database migrations:

    $ rails db:migrate

Execute the following to seed the database:

    $ rails db:seed

Run the following command to start the app:

    $ rails s

From this point forward, you can use postman to simulate bookings. For what params to send, check the below section of `API Endpoints`

## Usage

To run rspec test suites
```
bundle exec rspec
```

To run rubocop test
```
bundle exec rubocop
```

To run reek test
```
bundle exec reek
```

To run rails best practices test suite
```
rails_best_practices .
```

Bullet
`Bullet gem is enabled for checking potiential performance issues`

To enter rails console to see the activerecord objects:
```
rails c
```

To see the most recent created Resturant:
```
Resturant.last
```

Result:
```
Resturant Load (0.7ms)  SELECT "resturants".* FROM "resturants" ORDER BY "resturants"."id" DESC LIMIT $1  [["LIMIT", 1]]
=> #<Resturant:0x00007fae48ac48a8
 id: 3,
 name: "The Keg Steakhouse",
 from: 14,
 to: 22,
 max_allow_duration: 3,
 created_at: Wed, 13 Mar 2024 03:55:44.775078000 UTC +00:00,
 updated_at: Wed, 13 Mar 2024 03:55:44.775078000 UTC +00:00>
```
## API Endpoints

`POST http://localhost:3000/reservations`
Payload
```
{
    "resturant": "May Garden",
    "email": "allen@test.com",
    "time": 17,
    "duration": 2,
    "party_size": 4
}
```
`17`is hour of the day, for now it only makes reservation for today. If we want to add reservations for future date, need to update API to parse JSON dateObject in year, month, day, and hour.

Result:
`200 OK`

Potiential error messages with `400 bad request status code`
```
{
    "error": "No table availale at selected time range"
}
```
```
{
    "error": "Resturant does not exist"
}
```
```
{
    "error": "No available tables"
}
```
```
{
    "error": "No table availale at selected time range"
}
```
`GET http://localhost:3000/tables/occupied`
Params
```
{
    "time": 18
}
```
Result:
`200 OK`
`[]` if no table has been reserved
```
[
    {
        "id": 6,
        "size": 4
    },
    {
        "id": 3,
        "size": 3
    }
]
```
`id` is the reservation id, `size` is the party size.
