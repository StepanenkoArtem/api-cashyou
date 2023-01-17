FROM ruby:3.0.4-alpine

# update packages info
RUN apk update
RUN apk add --no-cache sudo

# Add ruby/rails sytem dependencies
RUN apk add --no-cache --update libxml2 libxslt postgresql-libs tzdata \
    libgcrypt-dev ruby-dev patch libpq-dev ruby-full \
    binutils-gold \
    build-base \
    curl \
    file \
    g++ \
    gcc \
    git \
    less \
    libstdc++ \
    libffi-dev \
    libc-dev \
    linux-headers \
    libxml2-dev \
    libxslt-dev \
    libgcrypt-dev \
    make \
    netcat-openbsd \
    nodejs \
    openssl \
    pkgconfig \
    postgresql-dev \
    tzdata \
    yarn

# create new user
ARG USER=user

# add new user to sudoers
RUN adduser -D ${USER} && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel \
    && adduser $USER wheel

# login as user
USER $USER
WORKDIR /app

RUN sudo chown -R $USER /app

EXPOSE 3000

ADD Gemfile ./

RUN sudo gem install bundler -v 2.2.33
RUN bundle config build.nokogiri --use-system-libraries
COPY . ./
RUN bundle install

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
