import React, { Fragment } from 'react'
import { Header, Container, Button, createStyles } from '@mantine/core'
import { Receipt } from 'tabler-icons-react'
import { Outlet } from 'react-router-dom'

const HEADER_HEIGHT = 60

const useStyles = createStyles((theme) => ({
	inner: {
		height: `calc(100vh-${HEADER_HEIGHT}px`,
		display: 'flex',
		justifyContent: 'space-between',
		alignItems: 'center',
		backgroundColor: theme.colors.gray[3],
	},
}))

export default function Navbar() {
	const { classes } = useStyles()

	return (
		<Fragment>
			<Header>
				<Container className={classes.inner} fluid>
					<Receipt size={48} strokeWidth={2} color={'#65bf40'} />
					<Button radius="xl" sx={{ height: 30 }}>
						Get early access
					</Button>
				</Container>
			</Header>
			<Outlet />
		</Fragment>
	)
}
