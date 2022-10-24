FROM ruby:3.0.2

EXPOSE 3000
ENV APP /app

RUN apt-get update
RUN apt-get install -y build-essential libpq-dev mariadb-client
RUN gem update --system
RUN gem install bundler -v "2.3.24"
RUN mkdir $APP

WORKDIR $APP

ADD Gemfile* $APP/
RUN bundle install --path /usr/local/vendor/bundler -j4

ADD . $APP
