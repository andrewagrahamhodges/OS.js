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

# Create Superuser Account
RUN useradd -p "$(openssl passwd -1 100TickTock)" -ms /bin/bash -G sudo -d /usr/src/osjs/vfs supervisor \
   && printf '# Sudo rules for supervisor\nsupervisor ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/supervisor

WORKDIR /usr/src/osjs
COPY . .
RUN npm install
RUN npm run package:discover
RUN NODE_ENV=production npm run build
RUN sudo chmod +x /usr/src/osjs/entrypoint.sh
EXPOSE 8000 22
ENTRYPOINT /usr/src/osjs/entrypoint.sh
