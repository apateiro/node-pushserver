FROM node:24.22.1-bookworm-slim@sha256:55fb5f5a527ea2c5c4a95f963e48ef90aa38c7b346054fdc8ee9957a2b55d205
WORKDIR /opt/pushserver
COPY package.json package-lock.json ./
RUN npm ci --omit=dev --ignore-scripts --no-audit --no-fund
COPY bin ./bin
COPY lib ./lib
COPY public ./public
ENTRYPOINT ["node", "bin/pushserver.js"]
