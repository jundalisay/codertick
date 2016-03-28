# Homework 3 - *CoderTicket*

**CoderTicket** is a Ruby on Rails blog application that allows users to create and buy tickets to cool events. 

Submitted by: **Juan Dalisay Jr.**

Time spent: **17** hours

Timeline

March 25 - Created users and sessions controllers and views (2 hours)

March 26 - Created order, venues scaffolds, tried omniauth failed (6 hours)

Learned from: https://www.youtube.com/watch?v=zQJtlvlNunw, https://www.youtube.com/watch?v=o0eVqNbapb0, and https://www.youtube.com/watch?v=Hw6WtWJwRtU

March 27 - Fixed forms at HatchMyIdea (2 hours), Added Publish Event and fixed event views (4 hours)

March 28 - Fixed Nested Routes and added features for Users(3 hours)

URL: **http://codertick.herokuapp.com/**

SimpleCov Test Coverage: **%**

## User Stories

The following **required** functionality is complete:

* [ ] 10 model tests, 2 route tests, 2 controller tests, 2 view tests.

#### Events

* [X] Users can see a list of upcoming events. Past events should not be shown. **HINT**: Good candidate for a test.
* [X] Users can search for events from the homepage.
* [X] Users can click on an event to see details about the event. 
* [X] Users can click on "Book Now" to go to a page to purchase tickets.

#### Tickets

* [X] Each event can have multiple types of tickets, each with a different `price` and `max_quantity`. 
* [..] Users can buy tickets to an event, choose the types of tickets, and the quantity of tickets.
* [ ] Users cannot buy more tickets than the quantity available.
* [ ] Users can only buy up to 10 of a ticket type at a time.
* [ ] Users cannot buy tickets to events that occur in the past. 

#### Users

* [X] User can sign up by providing their email, password, and name. 
* [X] User can login using an email and password. 
* [X] Users can create events. 
* [X] Users must click "publish event" before an event becomes viewable to other users. 
* [X] Users can create ticket types for that event. 
* [X] Users can create venues.
* [X] An event must have at least one `ticket_type` defined before it can be published. 
* [X] User can see a list of events he or she has created.
* [X] Users can edit their event after creation. But only the user who created the event can edit the event. 

### Optional Stories

* [..] Users can log in with Facebook. (learned thru https://www.youtube.com/watch?v=11BInedaQSo)
* [ ] Users receive an email when they have purchased a ticket.
* [ ] Users can see "related events" when browsing an event. Related events should belong to the same category and be in the same region.
* [ ] User A can allow User B to edit User A's event. In other words, an event owner can assign other people to be "event admins". 
* [ ] Ticket types have an optional "minimum" purchase quantity. ([Example Screenshot](http://i.imgur.com/DOYtAR0.png))
* [ ] Events are automatically labeled as "Hot". "Hot" events should have a red border or some sort of visual flourish. The event title should also be prefixed with "**HOT:**".
* [ ] Instead of showing all of the events on the main page, an "admin" user can dictate the events that show up on the main page.

## Notes

Describe any challenges encountered while building the app.

1. I have never done unit testing, so I put aside testing as the last things to do


## License

    Copyright [2016] [Juan Dalisay Jr.]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
