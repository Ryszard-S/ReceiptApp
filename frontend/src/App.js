import { useLocalStorage } from '@mantine/hooks'
import React, { useEffect } from 'react'
import { Fragment } from 'react'
import { useDispatch } from 'react-redux'
import { Route, Routes } from 'react-router-dom'

import Home from '../src/routes/home'
import { setCredentials } from './features/auth/authSlice'
import DashbordAppShell from './layouts/dashbordAppShell'
import LayoutWithHeader from './layouts/layoutWithHeader'
import Categories from './routes/categories'
import Expenses from './routes/expenses'
import Login from './routes/login'
import Logout from './routes/logout'
import PrivateRoute from './routes/private-route/PrivateRoute'
import Receipts from './routes/receipts'
import { Register } from './routes/register'
import Test from './routes/test'
import Test1 from './routes/test1'

function App() {
  const dispatch = useDispatch()
  const [token, setToken] = useLocalStorage({ key: 'token', defaultValue: null })

  useEffect(() => {
    console.warn('token in App.js', token)
    if (token) {
      dispatch(setCredentials({ accessToken: token }))
    }
  }, [token])

  return (
    <Fragment>
      <Routes>
        <Route path="/" element={<LayoutWithHeader />}>
          <Route index element={<Home />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
          <Route path="/logout" element={<Logout />} />
        </Route>
      </Routes>

      <Routes>
        <Route element={<PrivateRoute />}>
          <Route path="dashboard/*" element={<DashbordAppShell />}>
            <Route index path="expenses" element={<Expenses />} />
            <Route path="categories" element={<Categories />} />
            <Route path="receipts" element={<Receipts />} />
            <Route path="test" element={<Test />} />
            <Route path="test1" element={<Test1 />} />
          </Route>
        </Route>
      </Routes>
    </Fragment>
  )
}

export default App
