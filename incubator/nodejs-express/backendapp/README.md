# Node.JS Express Backend App with IBM Cloud App ID

## Setup

Following steps are required in order to leverage IBM Cloud App ID SDK bundled within this application. 

1. Create an instance of IBM Cloud App ID
2. Open `Applications` tab
3. Create new application
4. Copy `oauthServerUrl` property from the newly created application in App ID Dashboard into `app.js`

Start the app with `appsody run`. 

> When deploying your app to production environment it is recommended to store the above values using environment variables.