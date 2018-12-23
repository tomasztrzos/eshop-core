FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /eshop-core
WORKDIR /eshop-core
COPY Gemfile /eshop-core/Gemfile
COPY Gemfile.lock /eshop-core/Gemfile.lock
RUN bundle install
COPY . /eshop-core

EXPOSE 3000

CMD bundle exec passenger start -e {ENVIRONMENT}
