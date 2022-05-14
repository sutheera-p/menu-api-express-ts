FROM node:16-alpine AS development
ENV RUNIN development
WORKDIR /api-menu
COPY package.json ./
COPY yarn.lock ./
RUN yarn
COPY . ./
EXPOSE 3000
CMD [ "yarn", "dev" ]

FROM node:16-alpine AS yarn.prod
ENV RUNIN production
WORKDIR /api-menu
COPY package.json ./
COPY yarn.lock ./
COPY . ./
RUN yarn

FROM nginx:1.21.0-alpine AS production
COPY --from=yarn.prod /api-menu /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]