# "Pod Work" Project

## Overview
I need to record a video of the "work I've done for the pod".

This project will [create a basic React calendar](https://medium.com/@moodydev/create-a-custom-calendar-in-react-3df1bfd0b728) and [use webpack to bundle it into a C# .NET application](https://dev.to/milenamonteiro/how-to-easily-load-react-apps-into-an-aspnet-project-using-webpack-728).

I'm just going to code a quick calendar talking to an API with a UI test set up and put it forward as a "POC".

### Techology
* React
* Webpack

The database can be spun up and associated Liquibase changelogs applied by using:

`cd ./database`
`docker-compose up`

The Liquibase container exits after applying the changelogs.

API runs on localhost:4002 using 

`cd ./api`
`npx serverless offline` 
This runs the server on port 4002, check using curl or Postman:
`curl localhost:4002`

Dotnet-calendar project runs on localhost:3000 (which will use the React project) using 

`cd ./dotnet-calendar`
`npm start`

The React calendar project has been moved to the dotnet-calendar project, and can be run on localhost:3005 using:

`cd ./dotnet-calentdar/ClientApp`
`npm start`

UI testing framework runs using:

`cd ./ui-test`
`npx cypress run` to run headless or
`npx cypress open` to open the Cypress console

The dotnet calendar draws data from the database set up un the ./database folder as a docker-compose project. You can run the database on localhost port 5432 using:

`cd ./database`
`docker-compose up`

and then torn down via

`docker-compose down`