FROM node:16-alpine AS development
ENV RUNIN development
WORKDIR /api-menu
COPY package.json ./
COPY yarn.lock ./
RUN yarn
COPY . ./
EXPOSE 3000
CMD [ "yarn", "dev" ]

FROM node:16-alpine AS production
ENV RUNIN production
WORKDIR /api-menu
COPY package.json ./
COPY yarn.lock ./
RUN yarn
COPY . ./
CMD [ "yarn", "dev" ]