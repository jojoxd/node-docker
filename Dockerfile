FROM node:6.2.2

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php -y

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y ruby ruby-dev
RUN apt-get install -y php5.6 php5.6-cli php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml
RUN npm install --global grunt

RUN gem install sass
