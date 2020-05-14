FROM node:10
#Install all packages Needed
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-suggests --no-install-recommends software-properties-common \
  sudo \
  curl \
  wget \
  rsync \
  net-tools \
  iputils-ping \
  telnet \
  openssh-server \
  libpam-dev \
  nano \
  vim.tiny \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
 
WORKDIR /usr/src/osjs
COPY . .
RUN npm install
RUN npm run package:discover
RUN NODE_ENV=production npm run build
RUN sudo chmod +x /usr/src/osjs/entrypoint.sh
EXPOSE 8000 22
ENTRYPOINT /usr/src/osjs/entrypoint.sh
