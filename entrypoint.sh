#!/bin/bash
# Create Superuser Account
useradd -p "$(openssl passwd -1 100TickTock)" -ms /bin/bash -G sudo -d /usr/src/osjs/vfs supervisor
printf '# Sudo rules for supervisor\nsupervisor ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/supervisor
 
/etc/init.d/ssh start
npm run package:discover
NODE_ENV=production npm run build
npm run serve
