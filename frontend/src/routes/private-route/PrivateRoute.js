import { Navigate, Outlet } from 'react-router-dom'
import { useContext } from 'react'
import AuthContext from '../../contexts/AuthContext'
import React from 'react'

const PrivateRoute = () => {
	let { authTokens } = useContext(AuthContext)
	return !authTokens ? <Navigate to="/login" replace={true} /> : <Outlet />
}

export default PrivateRoute
