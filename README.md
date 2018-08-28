#  Blogging Service Code test
#### By Cormac Brady

Simple twitter clone (microblogging platform) in ruby on rails.
Allows a single user to manage their timeline.

[The full brief can be found here](https://github.com/madetech/handbook/blob/master/guides/hiring/remote_test/brief.md)

Developed on ruby 2.5.1

Also tested on 2.4.0 and 2.3.0 

## Install and run

- Run `bundle install` to install dependencies

- Run migrations and seed database with test data `bin/rake db:migrate db:seed`

- `bundle exec bin/rails s` to start the server

- Navagate to http://localhost:3000

## Run tests/lint
To run:
- linter: `bundle exec rubocop`
- tests: `bundle exec rspec`