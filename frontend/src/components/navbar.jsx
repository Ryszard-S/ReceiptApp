import React from 'react'
import { Header, Container, Button, createStyles } from '@mantine/core'

import { Receipt } from 'tabler-icons-react'

const HEADER_HEIGHT = 60

const useStyles = createStyles((theme) => ({
	inner: {
		height: HEADER_HEIGHT,
		display: 'flex',
		justifyContent: 'space-between',
		alignItems: 'center',
	},
}))

export default function HeaderAction() {
	const { classes } = useStyles()

	return (
		<Header>
			<Container className={classes.inner} fluid>
				<Receipt size={48} strokeWidth={2} color={'#65bf40'} />

				<Button radius="xl" sx={{ height: 30 }}>
					Get early access
				</Button>
			</Container>
		</Header>
	)
}
