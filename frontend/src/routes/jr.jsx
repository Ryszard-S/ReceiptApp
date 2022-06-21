import { Route, Routes } from 'react-router-dom'
import { Sidebar } from '../components/sidebar'
import Expenses from './expenses'
import Categories from './categories'
import Receipts from './receipts'
import Test from './test'
import Navbar from '../components/navbar'
import { useState } from 'react'
import { AppShell, Burger, MediaQuery, Text, useMantineTheme } from '@mantine/core'

function Jr() {
  const [opened, setOpened] = useState(false)
  const title = opened ? 'Close navigation' : 'Open navigation'

  const theme = useMantineTheme()

  return (
    <AppShell
      navbarOffsetBreakpoint="sm"
      asideOffsetBreakpoint="sm"
      fixed
      navbar={<Sidebar hiddenBreakpoint="sm" hidden={!opened} onClick={() => setOpened((o) => !o)}></Sidebar>}
      header={
        <Navbar height={70} p="md">
          <div style={{ display: 'flex', alignItems: 'center', height: '100%' }}>
            <MediaQuery largerThan="sm" styles={{ display: 'none' }}>
              <Burger opened={opened} onClick={() => setOpened((o) => !o)} size="sm" color={theme.colors.gray[6]} mr="xl" />
            </MediaQuery>

            <Text>Application header</Text>
          </div>
        </Navbar>
      }
    >
      <Routes>
        <Route path="/expenses" element={<Expenses />} />
        <Route path="/categories" element={<Categories />} />
        <Route path="/receipts" element={<Receipts />} />
        <Route path="/test" element={<Test />} />
      </Routes>
    </AppShell>
  )
}

export default Jr
