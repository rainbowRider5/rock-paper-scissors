# ONLY DEVELOPMENT ENVIRONMENT
FROM ruby:3.2.0-slim-bullseye AS rock-paper-scissors

# Install update and libraries
RUN apt-get update -qq && apt-get install -y build-essential && gem update --system 3.4.6

# Set working directory
WORKDIR /rock-paper-scissors

# Install gems
COPY Gemfile* ./
RUN bundle install

# Copy over the script that will be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Expose 3000 port
EXPOSE 3000

# Run server with foreman for development (on port 3000)
CMD "bin/dev -b 0.0.0.0"
