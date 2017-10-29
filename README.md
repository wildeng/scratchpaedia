# WIP: Scratchpaedia

This is a WIP Rails 5 wiki with some basic functionalities and capable to render formatted code. 

Main characteristics:

1. Postgres database
2. Uses Markdown styling syntax
3. Devise gem for authentication
4. AASM state machine to manage post states
5. Bootstrap styling

Up to now it lacks internationalization ( coming soon ) and some more features (like editing from the show view).

To install it:

* clone the project 
* run `bundle install`
* run `Rake db:create`
* run `Rake db:migrate`
* run `Rake db:seed` for basic data and a basic user
* run `Rails s` for running it in development mode
