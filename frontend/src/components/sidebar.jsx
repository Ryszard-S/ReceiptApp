import { Navbar, createStyles } from '@mantine/core'
import { Fragment, useState } from 'react'
import React from 'react'
import { Link, useLocation } from 'react-router-dom'
import { List, Login, Receipt2, TestPipe, ZoomMoney } from 'tabler-icons-react'

const useStyles = createStyles((theme, _params, getRef) => {
  const icon = getRef('icon')
  return {
    navbar: {
      backgroundColor: theme.colors.gray[3],
      minHeight: `calc(100vh - ${theme.other.headerHeight}px)`,
      height: 'auto'
    },

    link: {
      ...theme.fn.focusStyles(),
      display: 'flex',
      alignItems: 'center',
      textDecoration: 'none',
      fontSize: theme.fontSizes.sm,
      color: theme.colors.orange[6],
      padding: `${theme.spacing.xs}px ${theme.spacing.sm}px`,
      borderRadius: theme.radius.sm,
      fontWeight: 500,

      '&:hover': {
        backgroundColor: theme.colors.orange[3],
        color: theme.colors.dark,
        [`& .${icon}`]: {
          opacity: 0.9,
          color: theme.colors.grape
        }
      }
    },

    linkIcon: {
      ref: icon,
      color: theme.colors.orange[6],
      opacity: 0.75,
      marginRight: theme.spacing.sm
    },

    linkActive: {
      '&, &:hover': {
        backgroundColor: theme.colors.orange[6],
        color: theme.white,
        [`& .${icon}`]: {
          opacity: 0.9,
          color: theme.white
        }
      }
    }
  }
})

const data = [
  { link: 'expenses', label: 'Expenses', icon: ZoomMoney },
  { link: 'categories', label: 'Categories', icon: List },
  { link: 'receipts', label: 'Receipts', icon: Receipt2 },
  { link: 'test', label: 'test', icon: TestPipe },
  { link: 'test1', label: 'test1', icon: Login }
]
function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1)
}

export function Sidebar(props) {
  const { classes, cx } = useStyles()
  const location = useLocation()
  const x = location.pathname.split('/')
  const currentLocation = capitalizeFirstLetter(x[x.length - 1])
  const [active, setActive] = useState(currentLocation)

  const links = data.map((item) => (
    <Link
      className={cx(classes.link, { [classes.linkActive]: item.label === active })}
      to={item.link}
      key={item.label}
      onClick={() => {
        setActive(item.label)
      }}
    >
      <item.icon className={classes.linkIcon} />
      <span>{item.label}</span>
    </Link>
  ))

  return (
    <Fragment>
      <Navbar height={700} width={{ sm: 170 }} p="md" className={classes.navbar} {...props}>
        <Navbar.Section grow>{links}</Navbar.Section>
      </Navbar>
    </Fragment>
  )
}
