import { AppShell } from '@mantine/core'
import CustomHeader from '../components/header'
import React from 'react'
import { Outlet } from 'react-router-dom'

const LayoutWithHeader = () => {
  return (
    <AppShell fixed header={<CustomHeader />}>
      <Outlet />
    </AppShell>
  )
}

export default LayoutWithHeader
