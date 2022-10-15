import React, { useEffect } from 'react'
import { useSelector } from 'react-redux'
import { Navigate, Outlet, useLocation, useNavigate } from 'react-router-dom'

import { selectCurrentToken } from '../../features/auth/authSlice'

const PrivateRoute = () => {
  const location = useLocation()
  const token = useSelector(selectCurrentToken)
  // useEffect(() => {
  // 	navigate(-1)
  // }, [token])
  return !token ? <Navigate to="/login" state={{ from: location }} replace /> : <Outlet />
  // return <Outlet />
}

export default PrivateRoute
