import { AppShell, createStyles } from '@mantine/core'
import React from 'react'
import { Outlet } from 'react-router-dom'

import CustomHeader from '../components/header'

const useStyles = createStyles((theme) => ({
  main: {
    paddingTop: theme.other.headerHeight,
    paddingBottom: 0,
    paddingLeft: 0,
    paddingRight: 0
  }
}))
const LayoutWithHeader = () => {
  const { classes } = useStyles()
  return (
    <AppShell fixed header={<CustomHeader />} classNames={{ ...classes }}>
      <Outlet />
    </AppShell>
  )
}

export default LayoutWithHeader
