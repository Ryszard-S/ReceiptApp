import { createStyles } from '@mantine/core'
import React from 'react'

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
    backgroundImage: `url(https://picsum.photos/1920/1080 )`
  }
}))

export default function DivImageBackground({ children }) {
  const { classes } = useStyles()

  return <div className={classes.inner}>{children}</div>
}
