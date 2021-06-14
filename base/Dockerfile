FROM ruby:3.0-alpine3.13 AS base
RUN apk update && apk add --no-cache \
    build-base \
    tzdata \
    mysql-dev
WORKDIR /app

ENV RAILS_ENV=production

COPY Gemfile .
RUN bundle config set --local without 'development:test' 
RUN bundle check || bundle install --jobs=$(nproc)

COPY . .

FROM base AS assets
RUN apk add --no-cache \
    yarn \
    nodejs
RUN SECRET_KEY_BASE=fake-xxx bundle exec rails assets:precompile

FROM base AS prod
ENV RAILS_SERVE_STATIC_FILES=yes
ENV SECRET_KEY_BASE=secret-key-base
#ENV DISABLE_DATABASE_ENVIRONMENT_CHECK=1
COPY --from=assets /app/public /app/public
EXPOSE 3000
CMD ["bin/rails", "s", "--log-to-stdout", "-b", "0.0.0.0", "-p", "3000"]