import { Loader, Notification } from '@mantine/core'
import { useTimeout } from '@mantine/hooks'
import { showNotification } from '@mantine/notifications'
import React from 'react'

import { useGetShopsQuery } from '../features/shops/shopsApiSlice'
import useTitle from '../hooks/useTitle'

const Test1 = () => {
  useTitle('Test1')
  const { data: shops, isLoading, isError, isSuccess } = useGetShopsQuery({})

  const shopList = shops?.map((shop) => (
    <li key={shop.id}>
      {shop.id} {shop.name}
    </li>
  ))

  let content = <div />
  if (isLoading)
    showNotification({
      title: 'Loading...23',
      color: 'orange',
      message: 'Content is loading...'
    })
  if (isSuccess) {
    content = (
      <div>
        Test1
        <h1>This is test One !</h1>
        <ul>{shopList}</ul>
      </div>
    )
  }

  return content
}

export default Test1
