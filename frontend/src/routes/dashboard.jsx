import { AppShell, Burger, MediaQuery, useMantineTheme } from '@mantine/core'
import { useEffect, useState } from 'react'
import React from 'react'
import { useSelector } from 'react-redux'
import { Outlet } from 'react-router-dom'

import CustomHeader from '../components/header'
import { Sidebar } from '../components/sidebar'
import { selectCurrentToken } from '../features/auth/authSlice'

function Dashboard() {
  const [opened, setOpened] = useState(false)
  const title = opened ? 'Close navigation' : 'Open navigation'

  const theme = useMantineTheme()

  const tk = useSelector(selectCurrentToken)
  useEffect(() => {
    console.log('token from store', tk)
  }, [])

  return (
    <AppShell
      navbarOffsetBreakpoint="sm"
      asideOffsetBreakpoint="sm"
      fixed
      header={
        <CustomHeader
          buttonOpenSidebar={
            <MediaQuery largerThan="sm" styles={{ display: 'none' }}>
              <Burger opened={opened} onClick={() => setOpened((o) => !o)} size="sm" color={theme.colors.gray[6]} mr="xl" />
            </MediaQuery>
          }
        />
      }
      navbar={<Sidebar hiddenBreakpoint="sm" hidden={!opened} onClick={() => setOpened((o) => !o)}></Sidebar>}
    >
      <Outlet />
    </AppShell>
  )
}

export default Dashboard
