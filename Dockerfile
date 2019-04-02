FROM ruby:2.5
RUN mkdir -p /app 
WORKDIR /app
COPY Gemfile Gemfile.lock ./ 
RUN gem install bundler -v 1.17.3 && bundle install --jobs 20 --retry 5
COPY . ./
EXPOSE 3000
RUN rake db:create
RUN rake db:migrate
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]