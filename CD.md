# Peoject : Nodejs + Express + TypeScript

## CD

We use github actions to deploy the image to docker hub , here are the steps

- Build 
    - build code

- Push docker image to docker hub
    - login docker hub

    `run: docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD`

    - create date for tag image when push docker image to docker hub

    `run: echo "::set-output name=date::$(date +'%Y-%m-%d--%M-%S')"`

    - build docker image

    `run: docker build . --file Dockerfile --tag $DOCKER_USERNAME/$REPO_NAME:${{ steps.date.outputs.date }}`

    - push docker image

    `run: docker push $DOCKER_USERNAME/$REPO_NAME:${{ steps.date.outputs.date }}`