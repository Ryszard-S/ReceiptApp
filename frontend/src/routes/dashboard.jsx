import { Route, Routes } from 'react-router-dom'
import { Sidebar } from '../components/sidebar'
import Expenses from './expenses'
import Categories from './categories'
import Receipts from './receipts'
import Test from './test'
import CustomHeader from '../components/header'
import { useState } from 'react'
import { AppShell, Burger, MediaQuery, useMantineTheme } from '@mantine/core'
import React from 'react'
import Test1 from './test1'

function Dashboard() {
  const [opened, setOpened] = useState(false)
  const title = opened ? 'Close navigation' : 'Open navigation'

  const theme = useMantineTheme()

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
      <Routes>
        <Route path="/expenses" element={<Expenses />} />
        <Route path="/categories" element={<Categories />} />
        <Route path="/receipts" element={<Receipts />} />
        <Route path="/test" element={<Test />} />
        <Route path="/test1" element={<Test1 />} />
      </Routes>
    </AppShell>
  )
}

export default Dashboard
