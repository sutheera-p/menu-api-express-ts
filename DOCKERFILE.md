# Peoject : Nodejs + Express + TypeScript

## DockerFile

### development
    
    - พวกเราใช้ node version 16 ใน project นี้
    
    `FROM node:16-alpine AS development`
    
    - สร้าง env ชื่อ RUNIN = development เพื่อเช็คว่า run file docker-compose อันไหนอยู่
    
    `ENV RUNIN development`
    
    - สร้าง folder ชื่อ /api-menu
    
    `WORKDIR /api-menu`
    
    - COPY package.json และ yarn.lock
    
    `
    COPY package.json ./
    COPY yarn.lock ./
    `
    
    - run yarn เพื่อ install dependency
    
    `RUN yarn`
    
    - copy ทุกอย่างและสั่งให้รันที่ post 3000
    
    `
    COPY . ./
    EXPOSE 3000
    `
    
    - run project
    
    `CMD [ "yarn", "dev" ]`

### production

    - พวกเราใช้ node version 16 ใน project นี้
    
    `FROM node:16-alpine AS development`
    
    - สร้าง env ชื่อ RUNIN = development เพื่อเช็คว่า run file docker-compose อันไหนอยู่
    
    `ENV RUNIN development`
    
    - สร้าง folder ชื่อ /api-menu
    
    `WORKDIR /api-menu`
    
    - COPY package.json และ yarn.lock
    
    `
    COPY package.json ./
    COPY yarn.lock ./
    `
    
    - copy ทุกอย่าง
    
    `COPY . ./`
    
    - run yarn เพื่อ install dependency
    
    `RUN yarn`
    
    - พวกเราใช้ nginx version 1.21.0 ในการ deploy บน production
    
    `FROM nginx:1.21.0-alpine AS production`
    
    - copy ทุกอย่าง จาก step ข้าบนแล้วจะเก็บทุกอย่างไว้ใน folder ชื่อ /usr/share/nginx/html
    
    `COPY --from=yarn.prod /api-menu /usr/share/nginx/html`
    
    - copy nginx.conf และสั่งให้รันที่ post 80
    
    `
    COPY nginx.conf /etc/nginx/conf.d/default.conf
    EXPOSE 80
    `
    
    - run nginx
    
    `CMD ["nginx", "-g", "daemon off;"]`

## Docker-compose

### development
    
    `
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
    `
    
    - พวกเราใช้ version 3.8
    - image ชื่อ api-menu-dev
    - build ที่ target: development ใน Dockerfile
    - เก็บ file ไว้ใน folder src:/api-menu/src
    - รันที่ post 7000

#### run

```bash
docker-compose -f docker-compose.dev.yml up -d
```

### production

    `
    version: "3.8"

    services:
      app:
        container_name: api-menu-prod
        image: api-menu-prod
        build:
          context: .
          target: production
    `
    
    - พวกเราใช้ version 3.8
    - image ชื่อ api-menu-dev
    - build ที่ target: production ใน Dockerfile
    
#### run

```bash
docker-compose -f docker-compose.dev.yml up -d
```
