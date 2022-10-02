import React, { Fragment } from 'react'
import { Header as NativeHeader, Container, Button, createStyles, ActionIcon, UnstyledButton } from '@mantine/core'
import { Receipt } from 'tabler-icons-react'
import { Link, useNavigate } from 'react-router-dom'

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

function Header(props) {
  const { classes } = useStyles()
  const navigate = useNavigate()

  const redirectToHomePage = () => {
    navigate('/')
  }

  return (
    <Fragment>
      <NativeHeader height={HEADER_HEIGHT}>
        <Container className={classes.inner} fluid>
          {props.buttonOpenSidebar}
          <UnstyledButton>
            <Receipt size={48} strokeWidth={2} color={'#65bf40'} onClick={redirectToHomePage} />
          </UnstyledButton>
          <Link to={'/login'}>
            <Button radius="xl" sx={{ height: 30 }}>
              Login
            </Button>
          </Link>
        </Container>
      </NativeHeader>
      {props.children}
    </Fragment>
  )
}

export default Header
