FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Make /blog the main working directory
RUN mkdir /blog
WORKDIR /blog

# Copy the Gemfiles. This is a separate step so the dependencies 
# will be cached unless changes to one of those two files 
# are made.
COPY ./blog/Gemfile ./
COPY ./blog/Gemfile.lock ./

# COPY Gemfile /usr/src/app
# COPY Gemfile.lock /usr/src/app

RUN bundle install

# Copy the main application
ADD ./blog/ ./

# Execute the tests
RUN ["rails", "db:migrate", "RAILS_ENV=test"]
CMD ["bundle", "exec", "rspec"]

# Alternatively: Run the application
# EXPOSE 3000
# RUN ["rails", "db:migrate", "RAILS_ENV=development"]
# CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
