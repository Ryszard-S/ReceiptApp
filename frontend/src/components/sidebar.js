import { Fragment, useState } from 'react'
import { createStyles, Navbar } from '@mantine/core'
import { List, Receipt2, TestPipe, ZoomMoney } from 'tabler-icons-react'
import { Outlet, Link, useLocation } from 'react-router-dom'

const useStyles = createStyles((theme, _params, getRef) => {
  const icon = getRef('icon')
  return {
    navbar: {
      backgroundColor: theme.colors[theme.primaryColor][6],
      minHeight: 'calc(100vh - 61px)',
      height: 'auto'
    },

    link: {
      ...theme.fn.focusStyles(),
      display: 'flex',
      alignItems: 'center',
      textDecoration: 'none',
      fontSize: theme.fontSizes.sm,
      color: theme.white,
      padding: `${theme.spacing.xs}px ${theme.spacing.sm}px`,
      borderRadius: theme.radius.sm,
      fontWeight: 500,

      '&:hover': {
        backgroundColor: theme.colors[theme.primaryColor][5]
      }
    },

    linkIcon: {
      ref: icon,
      color: theme.white,
      opacity: 0.75,
      marginRight: theme.spacing.sm
    },

    linkActive: {
      '&, &:hover': {
        backgroundColor: theme.colors[theme.primaryColor][7],
        [`& .${icon}`]: {
          opacity: 0.9
        }
      }
    }
  }
})

const data = [
  { link: 'expenses', label: 'Expenses', icon: ZoomMoney },
  { link: 'categories', label: 'Categories', icon: List },
  { link: 'receipts', label: 'Receipts', icon: Receipt2 },
  { link: 'test', label: 'test', icon: TestPipe }
]
function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1)
}

export function Sidebar() {
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
      <Navbar height={700} width={{ sm: 170 }} p="md" className={classes.navbar}>
        <Navbar.Section grow>{links}</Navbar.Section>
      </Navbar>
      <Outlet />
    </Fragment>
  )
}
