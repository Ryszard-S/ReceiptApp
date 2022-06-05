import { Fragment, useState } from 'react'
import { Button, createStyles, Navbar } from '@mantine/core'
import { BellRinging, Key, Receipt2 } from 'tabler-icons-react'
import { Outlet, Link } from 'react-router-dom'

const useStyles = createStyles((theme, _params, getRef) => {
  const icon = getRef('icon')
  return {
    navbar: {
      backgroundColor: theme.colors[theme.primaryColor][6],
      height: 'calc(100vh - 61px)'
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
  { link: 'expenses', label: 'Expenses', icon: BellRinging },
  { link: 'categories', label: 'Categories', icon: Key },
  { link: 'receips', label: 'Receipts', icon: Receipt2 }
]

export function Sidebar() {
  const { classes, cx } = useStyles()
  const [active, setActive] = useState('Receipts')

  const links = data.map(
    (item) => (
      console.log(item.label, item.link),
      (
        <Link
          className={cx(classes.link, { [classes.linkActive]: item.label === active })}
          to={item.link}
          key={item.label}
          onClick={(event) => {
            setActive(item.label)
          }}
        >
          <item.icon className={classes.linkIcon} />
          <span>{item.label}</span>
        </Link>
      )
    )
  )

  return (
    <Fragment>
      <Navbar height={700} width={{ sm: 170 }} p="md" className={classes.navbar}>
        <Navbar.Section grow>{links}</Navbar.Section>
      </Navbar>
      <Outlet />
    </Fragment>
  )
}
