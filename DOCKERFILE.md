# Peoject : Nodejs + Express + TypeScript

## Docker File

We use Dockerfile and docker-compose for build code , install dependency and create docker image on development and production

### How to run docker file

- development
`docker-compose -f docker-compose.dev.yml up -d`
    - docker image will be stored in folder /api-menu

- production
`docker-compose -f docker-compose.prod.yml up -d`
    - docker image will be stored in folder /usr/share/nginx/html
