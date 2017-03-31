FROM ruby:2.4.0-alpine

RUN mkdir /myapp
WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

# COPY Gemfile /usr/src/app
# COPY Gemfile.lock /usr/src/app

RUN bundle install

ADD . /myapp

# COPY . /usr/src/app

# CMD ["bundle", "exec", "ruby", "myapp.rb", "-o", "0.0.0.0"]
