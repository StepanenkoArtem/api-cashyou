FROM ruby:3.0.4-alpine

# update packages info
RUN apk update
RUN apk add --no-cache sudo

# Add ruby/rails sytem dependencies
RUN apk add --no-cache --update libxml2 libxslt postgresql-libs tzdata \
    libgcrypt-dev ruby-dev patch libpq-dev ruby-full build-base

# create new user
ARG USER=user
ENV HOME /home/$USER
ENV APP $HOME/app

# add new user to sudoers
RUN adduser -D $USER \
   && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
   && chmod 0775 /etc/sudoers.d/$USER 

# login as user
USER $USER
WORKDIR $APP

RUN sudo chmod -R 0775 $HOME

EXPOSE 3000

ADD Gemfile* .

RUN sudo gem install bundler -v 2.2.33
RUN bundle install
ADD . .

# CMD /bin/sh -c "rm -f /app/tmp/pids/server.pid && ./bin/rails server"
