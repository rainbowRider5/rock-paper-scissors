# Minimal ruby setup
FROM ruby:3.2.0-bullseye AS rock-paper-scissors

RUN apt-get update

RUN gem update --system 3.4.5

# Minimal rails project setup
EXPOSE 3000

WORKDIR /opt/rock-paper-scissors

COPY Gemfile Gemfile

RUN gem install rails bundler && bundle install

CMD ["/bin/dev"]
