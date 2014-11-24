## Blog - my first AngularJS & Ruby on Rails App

Trial app based on sample app [*angularjs-and-rails-marriage*](https://github.com/monterail/angularjs-and-rails-marriage/) and tutorial [*Bootstrapping an AngularJS app in Rails 4.0*](http://asanderson.org/posts/2013/06/03/bootstrapping-angular-rails-part-1.html)

This is my first app using AngularJs and Ruby on Rails. So far I didn't do any testing but I will try to add it soon.
Firstly I created [*Blog*](https://github.com/marcinkornek/blog) but when I try to upload it into Heroku I encountered problems with assets.
After a lot of searching and reading I found this blog [*5 tips on how to use AngularJS with Rails that changed how we work by CODETUNES*](http://codetunes.com/2014/5-tips-on-how-to-use-angularjs-with-rails-that-changed-how-we-work/).
After a few transformation I managed to upload my app on heroku.

I changed:
* 'ngRoute' to 'ui-router'
* '$location' to '$state'
* I'm using 'ngResource'
* Added new CoffeeScript controller handling Header

## My Blog app on heroku
[*Blog*](http://sheltered-wave-7692.herokuapp.com/)

## testing
I wrote some Rails tests with RSpec and I just have Jasmine to test JavaScripts

## other
I also added:
* password confirmation checker - checks if password confirmation matches password in 'Sign up' form
* real-time username and email checker in 'Sign up' form
* pagination with 'will_paginate' gem and with 'UI Bootstrap' provided by 'rails-assets-angular-bootstrap' gem.
* page is divided into 3 areas: header, body and footer; header and body are ui-router views but footer is fixed so it is rails view.
* [*angular ui-router login authentication*](http://stackoverflow.com/a/22540482/3922041)
