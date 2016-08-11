FROM ruby:2.3.1

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs \
            nodejs \
            --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

RUN echo 'gem: --no-document' > /etc/gemrc

ENV APP_ROOT /usr/src/project_name
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT
COPY . $APP_ROOT

RUN bundle config --global build.nokogiri --use-system-libraries
RUN bundle config --global jobs 4
RUN bundle install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
