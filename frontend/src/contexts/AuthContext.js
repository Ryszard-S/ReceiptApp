import React, { useState, useEffect, useCallback } from 'react'

let logoutTimer

const AuthContext = React.createContext({
	token: '',
	isLoggedIn: false,
	login: (token) => {}
})

const retrieveStoredToken = () => {
	const storedToken = localStorage.getItem('token')

	return {
		token: storedToken,
	}
}

export const AuthContextProvider = (props) => {
	const tokenData = retrieveStoredToken()

	let initialToken
	if (tokenData) {
		initialToken = tokenData.token
	}

	const [token, setToken] = useState(initialToken)

	const userIsLoggedIn = !!token

	const logoutHandler = useCallback(() => {
		setToken(null)
		localStorage.removeItem('token')
	}, [])

	const loginHandler = (token) => {
		setToken(token)
		localStorage.setItem('token', token)
	}

	useEffect(() => {
		if (tokenData) {
			console.log(tokenData)
		}
	}, [tokenData])

	const contextValue = {
		token: token,
		isLoggedIn: userIsLoggedIn,
		login: loginHandler
	}

	return (
		<AuthContext.Provider value={contextValue}>
			{props.children}
		</AuthContext.Provider>
	)
}

export default AuthContext
