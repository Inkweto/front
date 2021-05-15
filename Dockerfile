## Build vue project
FROM node:12.18.1-alpine AS build
WORKDIR /app/
COPY ./package.json /app/
RUN npm install
COPY . /app/
RUN npm run build

# Dev user and workspace parameters
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG WORKSPACE=/app

USER node

## Create nginx server - uncomment to run on production
# FROM nginx:1.19.0-alpine AS prod-stage
# COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 8000
# CMD ["nginx", "-g", "daemon off;"]
