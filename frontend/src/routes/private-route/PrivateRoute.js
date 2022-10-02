import { Navigate, Outlet } from 'react-router-dom'
import { useContext } from 'react'
import AuthContext from '../../contexts/AuthContext'
import React from 'react'
import { useSelector } from 'react-redux'
import { selectCurrentToken } from '../../features/auth/authSlice'

const PrivateRoute = () => {
	// let { authTokens } = useContext(AuthContext)
	const token = useSelector(selectCurrentToken)
	return !token ? <Navigate to="/login" replace={true} /> : <Outlet />
}

export default PrivateRoute
