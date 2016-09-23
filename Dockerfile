FROM phusion/baseimage

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties bzip2 unzip openssh-client git lib32stdc++6 lib32z1 expect build-essential libssl-dev
RUN add-apt-repository ppa:ondrej/php -y

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

RUN node -v
RUN npm -v

RUN apt-get install -y ruby ruby-dev
RUN apt-get install -y php5.6 php5.6-cli php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml
RUN npm install --global grunt

RUN gem install sass
