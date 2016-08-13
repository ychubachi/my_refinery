FROM ruby:2.3.1

# Environments
ENV APP_ROOT /app_root

# Install apt packages
RUN apt-get update -qq && \
    apt-get install -y nodejs --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

# Set up bundler
RUN echo 'gem: --no-document' > /etc/gemrc
RUN bundle config --global build.nokogiri --use-system-libraries
RUN bundle config --global jobs 4

# Use cache for bundle install
WORKDIR $APP_ROOT
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

# Add App
ADD . $APP_ROOT

# Run Server
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
