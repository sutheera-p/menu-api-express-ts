# Peoject : Nodejs + Express + TypeScript

## CI

We use github actions to code integration checks , here are the steps

- Build 
    - pull code from branches dev
    - run yarn for install dependency
    
    `run: yarn`

- Push docker image to docker hub
