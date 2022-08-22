import { createContext, useState } from 'react'
import React from 'react'
const AuthContext = createContext()

export default AuthContext

export const AuthProvider = ({ children }) => {
	let [authTokens, setAuthTokens] = useState(() =>
		localStorage.getItem('authTokens')
			? JSON.parse(localStorage.getItem('authTokens'))
			: null
	)
	// let [loading, setLoading] = useState(true)

	let loginUser = async (e) => {
		let response = await fetch('http://localhost:8000/authorization/login/', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				username: e.username,
				password: e.password,
			}),
		})
		let data = await response.json()

		if (response.status === 200) {
			setAuthTokens(data)
			localStorage.setItem('authTokens', JSON.stringify(data))
		} else {
			alert('Something went wrong!')
		}
	}

	let logoutUser = () => {
		setAuthTokens(null)
		localStorage.removeItem('authTokens')
	}

	let contextData = {
		authTokens: authTokens,
		setAuthTokens: setAuthTokens,
		loginUser: loginUser,
		logoutUser: logoutUser,
	}

	// useEffect(() => {
	// 	if (authTokens) {
	// 		setUser(authTokens)
	// 	}
	// 	setLoading(false)
	// }, [authTokens, loading])

	return (
		<AuthContext.Provider value={contextData}>
			{/* {loading ? null : */}
			{children}
		</AuthContext.Provider>
	)
}
