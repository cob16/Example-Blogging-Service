#  Blogging Service Code test
#### By Cormac Brady

Simple twitter clone (microblogging platform) in ruby on rails.
Allows a single user to manage their timeline.

[The full brief can be found here](https://github.com/madetech/handbook/blob/master/guides/hiring/remote_test/brief.md)

Tested on ruby 2.5.1p57

## Install and run

- Run `bundle install` to install dependencies

- Run migrations `bin/rake db:migrate RAILS_ENV=test`

- `bundle exec bin/rails s` to start the server

- Navagate to http://localhost:3000

## Run tests/lint
To run:
- linter: `bundle exec rubocop`
- tests: `bundle exec rspec`