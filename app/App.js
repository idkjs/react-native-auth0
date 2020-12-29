/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React, { useState } from 'react';
import { Alert, Button, StyleSheet, Text, View } from 'react-native';
// import Auth0 from 'react-native-auth0';
import { client as auth0,onLogin,onLogout } from './RNAuth0.bs';
// var credentials = require('./auth0-configuration');

// const auth0 = new Auth0(credentials);
function App() {
	let [ accessToken, setAccessToken ] = useState(null);
	const _onLogin = () => {
		auth0.webAuth
			.authorize({
				scope: 'openid profile email'
			})
			.then((credentials) => {
				Alert.alert('AccessToken: ' + credentials.accessToken);
				setAccessToken({ accessToken: credentials.accessToken });
			})
			.catch((error) => console.log(error));
	};
	const _onLogout = () => {
		auth0.webAuth
			.clearSession({})
			.then((success) => {
				Alert.alert('Logged out!');
				setAccessToken({ accessToken: null });
			})
			.catch((error) => {
				console.log('Log out cancelled');
			});
	};

	let loggedIn = accessToken === null ? true : false;
	return (
		<View style={styles.container}>
			<Text style={styles.header}> Auth0Sample - Login </Text>
			<Text>You are{loggedIn ? ' ' : ' not '}logged in . </Text>
			<Button onPress={loggedIn ? onLogout : onLogin} title={loggedIn ? 'Log Out' : 'Log In'} />
		</View>
	);
}

const styles = StyleSheet.create({
	container: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'center',
		backgroundColor: '#F5FCFF'
	},
	header: {
		fontSize: 20,
		textAlign: 'center',
		margin: 10
	}
});

export default App;
