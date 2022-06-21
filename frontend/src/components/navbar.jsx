import React, { Children, Fragment } from 'react'
import { Header, Container, Button, createStyles } from '@mantine/core'
import { Receipt } from 'tabler-icons-react'
import { Link } from 'react-router-dom'

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

export default function Navbar({children}) {
  const { classes } = useStyles()

  return (
    <Fragment>
      <Header>
        <Container className={classes.inner} fluid>
          {children}

          <Receipt size={48} strokeWidth={2} color={'#65bf40'} />
          <Link to={'/login'}>
            <Button radius="xl" sx={{ height: 30 }}>
              Login
            </Button>
          </Link>
        </Container>
      </Header>
    </Fragment>
  )
}
