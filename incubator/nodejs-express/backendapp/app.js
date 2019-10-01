const express = require('express');
const passport = require('passport');
const APIStrategy = require('ibmcloud-appid').APIStrategy;

const app = express();
app.use(passport.initialize());
passport.use(new APIStrategy({
	oauthServerUrl: '',
}));

// Protect the API path
app.use('/api/', passport.authenticate(APIStrategy.STRATEGY_NAME, {
	session: false
}));

// The /api/data API used to retrieve protected data
app.get('/api/data', (req, res) => {
	res.json({
		data: 12345
	});
});
 
module.exports.app = app;
