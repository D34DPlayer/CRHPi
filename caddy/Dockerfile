# build stage
FROM node:lts as build-stage
RUN wget https://raw.githubusercontent.com/D34DPlayer/my-portfolio/master/package.json && \
    wget https://raw.githubusercontent.com/D34DPlayer/my-portfolio/master/package-lock.json
RUN npm install
WORKDIR /app
RUN git clone https://github.com/D34DPlayer/my-portfolio.git .
RUN ln -s /node_modules ./node_modules
RUN npm run build

# production stage
FROM caddy:2-alpine
COPY ./Caddyfile /etc/caddy/Caddyfile
COPY --from=build-stage /app/dist /usr/share/portfolio
