# Peoject : Nodejs + Express + TypeScript

## Contribution

This is the contributions of our team on creating Continuous Integration and Continuous Delivery

- Kunlasatree  Sadeangkun [Branch](https://github.com/sutheera-p/menu-api-express-ts/tree/setup-github-action)
	- CI github workflows
    
 - Sutheera  Preenan [Branch](https://github.com/sutheera-p/menu-api-express-ts/tree/setup-docker)
	- Dockerfile for development and production
	- Docker-compose for development and production

### About Project

This projects presents you with a feature-complete Express API built with TypeScript. You can test your API locally using terminal commands. Additionally, you can use a live client application, the ["WHATABYTE Dashboard"](https://dashboard.whatabyte.app/), as a testing harness to simulate production conditions and live user interactions.

#### Get Started

Clone the project in a directory called `menu-api` and checkout its `build-api` branch:

```bash
git clone git@github.com:sutheera-p/menu-api-express-ts.git  \
--branch dev
```

Make the project folder your current directory:

```bash
cd menu-api-express-ts
```

Then, install the project dependencies:

```bash
npm i
```
or
```bash
yarn
```

Finally, create a `.env` hidden file:

```bash
touch .env
```

Populate `.env` with this:

```bash
PORT=7000
```

Run the project by executing the following command:

```bash
npm run dev
```
or
```bash
yarn dev
```