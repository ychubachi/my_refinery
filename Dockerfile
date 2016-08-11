FROM ruby:2.3.1

RUN apt-get update -qq && \
    apt-get install -y nodejs --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

ENV APP_ROOT /app_root
WORKDIR $APP_ROOT
COPY . $APP_ROOT

RUN echo 'gem: --no-document' > /etc/gemrc
RUN bundle config --global build.nokogiri --use-system-libraries
RUN bundle config --global jobs 4
RUN bundle install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
