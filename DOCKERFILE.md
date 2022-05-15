# Peoject : Nodejs + Express + TypeScript

## DockerFile

### development

- พวกเราใช้ node version 16 ใน project นี้    
- สร้าง env ชื่อ RUNIN = development เพื่อเช็คว่า run file docker-compose อันไหนอยู่
- สร้าง folder ชื่อ /api-menu
- COPY package.json และ yarn.lock
- run yarn เพื่อ install dependency
- copy ทุกอย่างและสั่งให้รันที่ post 3000
- run project

```bash
FROM node:16-alpine AS development
ENV RUNIN development
WORKDIR /api-menu
COPY package.json ./
COPY yarn.lock ./
RUN yarn
COPY . ./
EXPOSE 3000
CMD [ "yarn", "dev" ]
```

### production

- พวกเราใช้ node version 16 ใน project นี้    
- สร้าง env ชื่อ RUNIN = development เพื่อเช็คว่า run file docker-compose อันไหนอยู่
- สร้าง folder ชื่อ /api-menu
- COPY package.json และ yarn.lock
- copy ทุกอย่าง
- run yarn เพื่อ install dependency
- พวกเราใช้ nginx version 1.21.0 ในการ deploy บน production
- copy ทุกอย่าง จาก step ข้าบนแล้วจะเก็บทุกอย่างไว้ใน folder ชื่อ /usr/share/nginx/html
- copy nginx.conf และสั่งให้รันที่ post 80
- run nginx

```bash
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
```

## Docker-compose

### development

- พวกเราใช้ version 3.8
- image ชื่อ api-menu-dev
- build ที่ target: development ใน Dockerfile
- เก็บ file ไว้ใน folder src:/api-menu/src
- รันที่ post 7000

```bash
version: "3.8"

services:
  app:
    container_name: api-menu-dev
    image: api-menu-dev
    build:
      context: .
      target: development
    volumes:
      - ./src:/api-menu/src
    ports:
      - 7000:3000
```

#### run

```bash
docker-compose -f docker-compose.dev.yml up -d
```

### production

- พวกเราใช้ version 3.8
- image ชื่อ api-menu-dev
- build ที่ target: production ใน Dockerfile

```bash
version: "3.8"

services:
  app:
    container_name: api-menu-prod
    image: api-menu-prod
    build:
      context: .
      target: production
```
    
#### run

```bash
docker-compose -f docker-compose.dev.yml up -d
```
