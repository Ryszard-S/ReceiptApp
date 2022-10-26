import { Table } from '@mantine/core'
import React, { Fragment } from 'react'
import { useParams } from 'react-router-dom'

import { useGetReceiptsQuery } from '../features/receipts/receiptsApiSlice'

const ReceiptDetails = () => {
  const { receiptId } = useParams()
  const { receipt = [] } = useGetReceiptsQuery('receiptsList', {
    selectFromResult: ({ data }) => ({
      receipt: data?.entities[receiptId]
    })
  })

  return (
    <Fragment>
      <h3>Receipt details</h3>
      <Table>
        <thead>
          <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Category</th>
          </tr>
        </thead>

        <tbody>
          {receipt?.items?.map((item) => {
            return (
              <tr key={item.id}>
                <td>{item.id}</td>
                <td>{item.name}</td>
                <td>{item.price}</td>
                <td>{item.category.name}</td>
              </tr>
            )
          })}
        </tbody>
      </Table>
    </Fragment>
  )
}

export default ReceiptDetails
