FROM node:20-bullseye-slim AS build
WORKDIR /app
COPY  ./app.js ./dice.js ./package.json package-lock.json /app
RUN npm install && npm install express 

FROM gcr.io/distroless/nodejs20-debian11
COPY --from=build /app /usr/src/app
WORKDIR /usr/src/app
CMD ["app.js"]
