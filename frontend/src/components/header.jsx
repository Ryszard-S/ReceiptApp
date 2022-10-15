import { Container, Header as NativeHeader, Text, UnstyledButton, createStyles, useMantineTheme } from '@mantine/core'
import React from 'react'
import { useSelector } from 'react-redux'
import { useLocation, useNavigate } from 'react-router-dom'
import { LayoutDashboard, Login, Logout, Receipt } from 'tabler-icons-react'

import { selectCurrentToken } from '../features/auth/authSlice'
import ButtonLink from './buttonWithLink'

const useStyles = createStyles((theme) => ({
  inner: {
    height: 'inherit',
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    backgroundColor: theme.colors.gray[3],
  }
}))

function Header({ buttonOpenSidebar }) {
  const { classes } = useStyles()
  const navigate = useNavigate()
  const isLogin = useSelector(selectCurrentToken)
  const theme = useMantineTheme()

  const redirectToHomePage = () => {
    navigate('/')
  }

  const location = useLocation()
  console.log(location.pathname)
  let displayDashboardButton = false
  if (location.pathname === '/' && isLogin) {
    displayDashboardButton = true
  }

  return (
    <NativeHeader height={theme.other.headerHeight}>
      <Container className={classes.inner} fluid>
        {buttonOpenSidebar}
        <UnstyledButton>
          <Receipt size={48} strokeWidth={2} color={'#65bf40'} onClick={redirectToHomePage} />
        </UnstyledButton>
        {displayDashboardButton && (
          <ButtonLink linkTo="/dashboard" leftIcon={<LayoutDashboard />}>
            Dashboard
          </ButtonLink>
        )}
        {isLogin ? (
          <ButtonLink linkTo="/logout" leftIcon={<Logout />}>
            Logout
          </ButtonLink>
        ) : (
          <ButtonLink linkTo="/login" leftIcon={<Login />}>
            Login
          </ButtonLink>
        )}
      </Container>
    </NativeHeader>
  )
}

export default Header
