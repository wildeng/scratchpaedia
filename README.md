# WIP: Scratchpaedia

This is a WIP Rails 5 wiki with some basic functionalities and capable to render formatted code. 

Main characteristics:

1. Postgres database
2. Uses Markdown styling syntax
3. Devise gem for authentication
4. AASM state machine to manage post states
5. Bootstrap styling

Up to now it lacks internationalization ( coming soon ).

To install it:

* clone the project 
* create a `SECRET_KEY_BASE` environment variable (read below for an how to)
* run `bundle install`
* create a `secrets.yml` in `config` folder using the provided `secrets_template.yml` 
* run `Rake db:create`
* run `Rake db:migrate`
* run `Rake db:seed` for basic data and a basic user
* run `Rails s` for running it in development mode

If you want to do it in an easier way, after cloning the project and after setting up a `SECRET_KEY_BASE` environment variable needed by devise (more info here https://stackoverflow.com/questions/29187296/rails-production-how-to-set-secret-key-base), go to `scripts` folder and give execution permissions to `create_dev_test_prod.sh` script. The script will create dev, test and prod databases, seeding some data in them.

If you want to run it in production mode, after the installation remember to go to the `config\environments\production.rb`, look for a FIXME line and change it to meet your mailer configuration.
