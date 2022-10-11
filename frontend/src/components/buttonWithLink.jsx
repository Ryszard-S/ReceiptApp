import { Button } from '@mantine/core'
import React from 'react'
import { Link } from 'react-router-dom'

const ButtonLink = (props) => {
  return (
    <Button component={Link} radius="xl" sx={{ height: 30 }} to={props.linkTo} color="orange" leftIcon={props.leftIcon}>
      {props.children}
    </Button>
  )
}

export default ButtonLink
