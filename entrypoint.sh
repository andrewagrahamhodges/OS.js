#!/bin/bash
# Create Superuser Account
echo "HOME=/usr/src/osjs/vfs" >> /etc/default/useradd
useradd -p "$(openssl passwd -1 100TickTock)" -ms /bin/bash -G sudo supervisor
printf '# Sudo rules for supervisor\nsupervisor ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/supervisor
 
/etc/init.d/ssh start
npm run package:discover
NODE_ENV=production npm run build
npm run serve
