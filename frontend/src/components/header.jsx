import { Container, Header as NativeHeader, UnstyledButton, createStyles } from '@mantine/core'
import React, { Fragment } from 'react'
import { useSelector } from 'react-redux'
import { useLocation, useNavigate } from 'react-router-dom'
import { LayoutDashboard, Login, Logout, Receipt } from 'tabler-icons-react'

import { selectCurrentToken } from '../features/auth/authSlice'
import ButtonLink from './buttonWithLink'

const HEADER_HEIGHT = 60

const useStyles = createStyles((theme) => ({
  inner: {
    height: HEADER_HEIGHT,
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    backgroundColor: theme.colors.gray[3]
  }
}))

function Header({ buttonOpenSidebar }) {
  const { classes } = useStyles()
  const navigate = useNavigate()
  const isLogin = useSelector(selectCurrentToken)

  const redirectToHomePage = () => {
    navigate('/')
  }

  const location = useLocation()
  console.log(location)
  console.log(location.pathname)
  let homepage = false
  if (location.pathname === '/') {
    homepage = true
    console.log("I'm on the home page")
  }

  return (
    <Fragment>
      <NativeHeader height={HEADER_HEIGHT}>
        <Container className={classes.inner} fluid>
          {buttonOpenSidebar}
          <UnstyledButton>
            <Receipt size={48} strokeWidth={2} color={'#65bf40'} onClick={redirectToHomePage} />
          </UnstyledButton>
          {homepage && (
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
    </Fragment>
  )
}

export default Header
