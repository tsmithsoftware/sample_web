# "POC" Project

## Overview
This project will create a basic Flutter web application that pulls data from an API / DB backend and displays it in a browser, secured via Keycloak and UI tested via Selenium, with DB change management handled via Liquibase.

### Technology
* NodeJS
* Docker
* PostgreSQL
* Liquibase
* Keycloak
* .NET Core

### Diagram
![diagram](./readme_resources/project_outline.drawio.png)

#### DB
The database can be spun up and associated Liquibase changelogs applied by using:

`cd ./database`
`docker-compose up`

The Liquibase container exits after applying the changelogs.

#### API
A sample Node.js API using the serverless framework runs on localhost:4002 using 

`cd ./api`
`npx serverless offline` 
This runs the server on port 4002, check using curl or Postman:
`curl localhost:4002`

The main .NET Core API being used runs as part of the dotnet-calendar project.

### PGAdmin
The PGAdmin container allows inspection of the database. The database can be connected to using the docker network gateway address, which can be found using `docker network inspect bridge`, and the username and password specified in the docker-compose setup.

#### .NET
Dotnet-calendar project runs on localhost:3000 (which will use the React project) using 

`cd ./dotnet-calendar`
`npm start`

The certificates for the Docker container were generated using the process outlined at https://stackoverflow.com/questions/60724704/asp-net-core-application-in-docker-over-https.

Please keep in mind that **copying the certificates into the Docker container is an anti-pattern and is HIGHLY discouraged.** In this case, because the solution is a development application that will not be deployed, we don't care so much about certificate security.

#### React
The React calendar project has been moved to the dotnet-calendar project, and can be run on localhost:3005 using:

`cd ./dotnet-calentdar/ClientApp`
`npm start`

#### NGINX
The docker-compose project has NGINX set up as a reverse proxy for SSL termination and DNS resolution (of a type - the resolution uses the local hosts file, please see "Host file updates" for details.)

#### Hosts file updates
The [hosts file](https://en.wikipedia.org/wiki/Hosts_(file)) is a plain text operating system file that maps hostnames to IP addresses. It acts as a local [DNS](https://en.wikipedia.org/wiki/Domain_Name_System). The docker-compose setup uses the VIRTUAL_HOST environment variable inside the containers to work with the [nginx-proxy](https://github.com/nginx-proxy/nginx-proxy) Docker image, which requires the users' DNS to be set up to forward requests to the particular host running nginx-proxy. Updating the hosts file is a quick, localised and easy method of doing this.

#### UI Testing
UI testing framework runs using:

`cd ./ui-test`
`npx cypress run` to run headless or
`npx cypress open` to open the Cypress console

The dotnet calendar draws data from the database set up under the ./database folder as a docker-compose project, as mentioned before.

#### Auth
Keycloak is used as an authentication/SSO solution as a stand-in for any OAuth / OIDC systems used.