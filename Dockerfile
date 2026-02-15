# syntax = docker/dockerfile:1

ARG RUBY_VERSION=3.1.3
FROM ruby:${RUBY_VERSION}-slim as base

WORKDIR /rails

ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT="development test"

# ---------------- BUILD STAGE ----------------
FROM base as build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    libpq-dev \
    pkg-config \
    nodejs \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN bundle exec bootsnap precompile app/ lib/

ENV RAILS_ENV=production \
    SECRET_KEY_BASE=dummy \
    RAILS_MASTER_KEY=dummy \
    DATABASE_URL=postgresql://dummy

RUN bundle exec rails assets:precompile

# ---------------- FINAL STAGE ----------------
FROM base

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl \
    libpq5 \
    nodejs \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp

USER rails:rails

ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["./bin/rails", "server"]
