#!/bin/bash
useradd -p "$(openssl passwd -1 100TickTock)" -ms /bin/bash -G sudo demo \
&& printf '# Sudo rules for demo\ndemo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/demo
/etc/init.d/ssh start
npm run package:discover
NODE_ENV=production npm run build
npm run serve
