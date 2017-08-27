FROM phusion/baseimage

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties bzip2 unzip openssh-client git lib32stdc++6 lib32z1 expect build-essential libssl-dev
RUN add-apt-repository ppa:ondrej/php -y

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get remove -y cmdtest && apt-get install -y yarn
ENV PATH ${PATH}:`yarn global bin`

# we need npm ^5.4.0 - see https://github.com/electron-userland/electron-packager/issues/712
# https://github.com/npm/npm/issues/16807#issuecomment-313591975
RUN yarn global add npm@^5.4.0

# for windows packaging using electron-packager
RUN curl -sS https://dl.winehq.org/wine-builds/Release.key | apt-key add -
RUN apt-add-repository -y 'https://dl.winehq.org/wine-builds/ubuntu/' && apt-get update
RUN apt-get install -y wine-stable:i386

RUN node -v
RUN npm -v
RUN yarn --version

RUN apt-get install -y ruby ruby-dev
RUN apt-get install -y --allow-unauthenticated php5.6 php5.6-cli php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml
RUN npm install --global grunt

RUN gem install sass
