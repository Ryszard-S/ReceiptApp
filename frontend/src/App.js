import React, { useEffect } from 'react'
import { Fragment } from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { Route, Routes } from 'react-router-dom'
import { Home } from 'tabler-icons-react'

import { selectCurrentToken, setCredentials } from './features/auth/authSlice'
import LayoutWithHeader from './layouts/layoutWithHeader'
import Categories from './routes/categories'
import Dashboard from './routes/dashboard'
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

  useEffect(() => {
    const token = localStorage.getItem('token')
    if (token) {
      dispatch(setCredentials({ accessToken: token }))
    }
  }, [])

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
          <Route path={'dashboard'} element={<Dashboard />}>
            <Route path="expenses" element={<Expenses />} />
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
