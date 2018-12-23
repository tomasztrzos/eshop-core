#! /bin/bash
set -u

bundle install

bundle exec rails db:create RAILS_ENV=test
bundle exec rails db:schema:load RAILS_ENV=test
bundle exec rspec
