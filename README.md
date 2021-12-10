Chitter Challenge
=================

A small Twitter clone that will allow the users to post messages to a public stream.

To use this project (visit the heroku page)[]

[Planning](#Planning) | [Design](#Design) | [Testing and Development](#Work)| [CD/CI](#CD/CI)|


<h2 id="Planning">Planning</h2>

------------------------------------

[User Stories](#user_stories) | [Domain Models](#domain_models)| [Http Request](#http_request) | [Wireframes](#wireframes)|

 <h3 id="user_stories">User Stories</h3>

Below are the user stories to use for building this project

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

<h3 id="domain_models">Domain models</h3>

| Object | Action |
|--------|--------|
|User| post a message (peep)|
||sign up for chitter|
||log in to chitter|
||logout of chitter|
||receive an email if you are tagged in a peep|
|Peep|see the time at which it was made|
||see all peeps in reverse chronological order|

![Domain_Model](resources/domain-models.png)

<h3 id="http_request">HTTP request</h3>

![HTTP_request](resources/http-request.png)

<h3 id="wireframes">Wireframes</h3>

#### Mobile

![mobile home](resources/mobile-home.png)

![mobile profile](resources/mobile-profile.png)


#### Wider screens

![home](resources/home.png)

![profile](resources/profile.png)