
#!/bin/sh

rm -rf node_modules/
yarn install --offline --force
mkdir -p node_modules/puppeteer/.local-chromium
tar -xvzf lib/linux-555668.tar.gz -C node_modules/puppeteer/.local-chromium/