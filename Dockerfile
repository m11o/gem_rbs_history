FROM ruby:3.1.1

RUN apt-get update -qq && apt-get install -y gnupg curl

# mongodb
RUN curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
    sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
RUN echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
RUN sudo apt-get update && sudo apt-get install -y mongodb-org

# nodejs & yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -y && apt-get install -y yarn nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile* /app/
RUN bundle install
