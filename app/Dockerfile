# 1. Base image with Ruby
FROM ruby:3.2-bullseye

# 2. Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*

# 3. Set working directory inside container
WORKDIR /app

# 4. Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# 5. Copy the rest of the Rails app
COPY . .

# 6. Precompile assets for production
RUN bundle exec rails assets:precompile

# 7. Expose the port Puma will run on
EXPOSE 3000

# 8. Default command to run the app
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
