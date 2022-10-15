import { Button } from '@mantine/core'
import React from 'react'

const ButtonDelete = (props) => {
  return (
    <Button variant="subtle" color="red" radius="xl" size="xs" compact {...props}>
      Delete
    </Button>
  )
}

export default ButtonDelete
