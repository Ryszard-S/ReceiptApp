import { createStyles } from '@mantine/core'
import { useEffect, useRef, useState } from 'react'

const HEADER_HEIGHT = 61

const useStyles = createStyles((theme) => ({
	inner: {
		height: `calc(100vh - ${HEADER_HEIGHT}px)`,
		backgroundPosition: `center`,
		backgroundRepeat: `no-repeat`,
		backgroundSize: `cover`,
		display: `flex`,
		justifyContent: `center`,
		flexDirection: `column`,
		alignItems: `center`,
		backgroundImage: `url(https://picsum.photos/1920/1080 )`,
	},
}))

export default function DivImageBackground({ children }) {
	const { classes } = useStyles()
	const [width, setWidth] = useState(0)
	const [height, setHeight] = useState(0)
	const elementRef = useRef(null)

	useEffect(() => {
		setWidth(elementRef.current.getBoundingClientRect().width)
		setHeight(elementRef.current.getBoundingClientRect().height)
		console.log(width, height)
	}, [height, width])
	return (
		<div
			ref={elementRef}
			className={classes.inner}
			style={{
				// backgroundImage: `url(https://picsum.photos/2000/1000/ )`,
				// backgroundImage: `url(https://picsum.photos/${width}/${height}/ )`,
				color: 'greenyellow',
			}}
		>
			{children}
		</div>
	)
}
