FROM ruby:3.1.4
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN apt-get update -qq && \
    apt-get install -y \
      curl \
      gnupg \
      build-essential \
      default-libmysqlclient-dev \
      libstdc++6 \
      gcc \
      g++ \
      git \
      pkg-config && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | \
    gpg --dearmor -o /usr/share/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x bookworm main" > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update -qq && \
    apt-get install -y nodejs npm && \
    npm install -g yarn && \
    curl https://sh.rustup.rs -sSf | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /to_do_application
RUN gem install bundler:2.3.17
COPY Gemfile /to_do_application/Gemfile
COPY Gemfile.lock /to_do_application/Gemfile.lock
COPY yarn.lock /to_do_application/yarn.lock
COPY package.json /to_do_application/package.json
RUN bundle install
RUN yarn install
COPY . /to_do_application
CMD ["rails", "server", "-b", "0.0.0.0"]