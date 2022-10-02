import React, { useEffect } from 'react'
import { Fragment } from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { Routes, Route } from 'react-router-dom'
import { Home } from 'tabler-icons-react'
import Header from './components/header'
import { selectCurrentToken, setCredentials } from './features/auth/authSlice'
import Dashboard from './routes/dashboard'
import Login from './routes/login'
import PrivateRoute from './routes/private-route/PrivateRoute'
import { Register } from './routes/register'

function App() {
  const tk = useSelector(selectCurrentToken)
  const dispatch = useDispatch()

  useEffect(() => {
    const token = localStorage.getItem('token')
    console.log('tk before', tk, token)
    if (token) {
      dispatch(setCredentials({ accessToken: token }))

      console.log('tk after', tk)
    }
  }, [])

  return (
    <Fragment>
      <Header>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
        </Routes>
      </Header>
      <Routes>
        <Route element={<PrivateRoute />}>
          <Route path={'/dashboard/*'} element={<Dashboard />} />
        </Route>
      </Routes>
    </Fragment>
  )
}

export default App
