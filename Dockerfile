FROM ruby:2.3.0
ADD . /tech_request
WORKDIR /tech_request
RUN bundle exec rake db:drop db:create db:schema:load db:seed locations:create room_types:create RAILS_ENV=production
EXPOSE 3000
CMD ["rails", "s -p"]