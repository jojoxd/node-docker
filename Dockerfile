FROM node:6.2.2

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install ruby ruby-dev ruby-bundler

RUN gem install sass