FROM ruby:3.0.3-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk add --update \
	build-base \
	tzdata \
	sqlite \
	sqlite-dev \
	nodejs \
	npm \
	&& rm -rf /var/cache/apk/*

RUN npm install --global yarn

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ENV SECRET_KEY_BASE key

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle config --global frozen 1
RUN bundle install --without development test

COPY . /usr/src/app
RUN bundle exec rake DATABASE_URL=postgresql:does_not_exist assets:precompile
RUN rake db:migrate

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

