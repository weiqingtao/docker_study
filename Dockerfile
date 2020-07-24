# Install Stage
FROM node:12 AS installer
WORKDIR /srv

COPY package.json yarn.lock ./

RUN  yarn

COPY . .

# Run stage
FROM node:12
WORKDIR /srv
COPY --from=installer /srv/. .

ENTRYPOINT [ "node", "bin/www" ]
