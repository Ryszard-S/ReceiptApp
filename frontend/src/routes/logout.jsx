import { Button } from '@mantine/core'
import { useLocalStorage } from '@mantine/hooks'
import React from 'react'
import { useDispatch } from 'react-redux'

import { logOut } from '../features/auth/authSlice'

const Logout = () => {
  const [value, setValue, removeValue] = useLocalStorage({ key: 'token' })
  const dispatch = useDispatch()
  console.log(value)

  const handleLogout = () => {
    removeValue()
    dispatch(logOut())
  }

  return <Button onClick={handleLogout}>Toggle</Button>
}

export default Logout
