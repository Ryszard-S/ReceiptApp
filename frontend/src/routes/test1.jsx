import React from 'react'
import { useGetShopsQuery } from '../features/shops/shopsApiSlice'
import { Loader, Notification } from '@mantine/core'
import { showNotification } from '@mantine/notifications'

const Test1 = () => {
  const { data: shops, isLoading, isError, isSuccess } = useGetShopsQuery()

  const shopList = shops?.map((shop) => (
    <li key={shop.id}>
      {shop.id} {shop.name}
    </li>
  ))

  let content
  if (isLoading)
    showNotification({
      title: 'Loading...',
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
