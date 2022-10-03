import { Route, Routes } from 'react-router-dom'
import { Sidebar } from '../components/sidebar'
import Expenses from './expenses'
import Categories from './categories'
import Receipts from './receipts'
import Test from './test'
import CustomHeader from '../components/header'
import { useEffect, useState } from 'react'
import { AppShell, Burger, MediaQuery, useMantineTheme } from '@mantine/core'
import React from 'react'
import Test1 from './test1'
import { useSelector } from 'react-redux'
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

    </AppShell>
  )
}

export default Dashboard
