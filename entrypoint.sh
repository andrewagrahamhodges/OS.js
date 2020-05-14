#!/bin/bash
/etc/init.d/ssh start
npm run package:discover
NODE_ENV=production npm run build
npm run serve
