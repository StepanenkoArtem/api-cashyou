FROM alpine:latest

# update packages info
RUN apk update
RUN apk add --no-cache sudo

# create new user
ARG USER=user
ENV HOME /home/$USER

# add new user to sudoers
RUN adduser -D $USER \
   && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
   && chmod 0440 /etc/sudoers.d/$USER

# login as user
USER $USER
WORKDIR $HOME
EXPOSE 3000

COPY . .

RUN sudo apk add ruby-dev
RUN sudo gem install bundler
