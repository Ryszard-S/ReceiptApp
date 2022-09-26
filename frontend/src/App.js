import React from 'react'
import { Fragment } from 'react'
import { Routes, Route } from 'react-router-dom'
import { Home } from 'tabler-icons-react'
import Header from './components/header'
import Dashboard from './routes/dashboard'
import Login from './routes/login'
import PrivateRoute from './routes/private-route/PrivateRoute'
import { Register } from './routes/register'

function App() {
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
