FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /courseR
WORKDIR /courseR
COPY Gemfile /courseR/Gemfile
COPY Gemfile.lock /courseR/Gemfile.lock
RUN bundle install
COPY . /courseR