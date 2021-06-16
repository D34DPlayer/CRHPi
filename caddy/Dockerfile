# build stage
FROM node:lts as build-stage
## WILL BE USEFUL IF I ADD PRE-RENDERING
#ARG VUE_APP_DOMAIN_NAME=localhost
#RUN apt-get update && \
#    apt-get -y install ca-certificates fonts-liberation                       \
#        libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6    \
#        libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1       \
#        libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0       \
#        libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1           \
#        libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6     \
#        libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils
RUN wget https://raw.githubusercontent.com/D34DPlayer/my-portfolio/master/package.json
RUN npm install
WORKDIR /app
RUN git clone https://github.com/D34DPlayer/my-portfolio.git .
RUN mv /node_modules ./node_modules
RUN npm run build

# production stage
FROM caddy:2-alpine
COPY ./Caddyfile /etc/caddy/Caddyfile
COPY --from=build-stage /app/dist /usr/share/portfolio
