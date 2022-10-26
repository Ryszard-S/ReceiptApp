import { SimpleGrid } from '@mantine/core'
import React, { useMemo } from 'react'
import { Outlet, useNavigate } from 'react-router-dom'

import { TableWithSort } from '../components/TableWithSort'
import { useGetReceiptsQuery } from '../features/receipts/receiptsApiSlice'

const getReceiptsWithSum = (id, receipt) => {
  let sum = receipt.items.reduce((acc, item) => acc + +item.price, 0)
  sum = Number(sum.toFixed(2))
  let date = new Date(receipt.date)
  return { id, date, shop: receipt.shop.name, sum }
}

const ReceiptList = () => {
  const navigate = useNavigate()
  const { data: receiptList = [], isSuccess } = useGetReceiptsQuery('receiptsList')
  const memoReceiptsList = useMemo(() => {
    const { ids, entities } = receiptList
    const recWithSum = ids?.map((r) => getReceiptsWithSum(r, entities[r]))
    return recWithSum
  }, [receiptList])

  console.log('memoReceiptsList', memoReceiptsList)
  const handleClick = (event) => {
    console.log('id', event.currentTarget.id)
    navigate(`/dashboard/receipt_list/${event.currentTarget.id}`)
  }

  let table
  if (isSuccess) {
    table = <TableWithSort data={memoReceiptsList} onClick={handleClick} />
  }

  return (
    <SimpleGrid
      cols={2}
      spacing="lg"
      breakpoints={[
        { maxWidth: 'md', cols: 2, spacing: 'sm' },
        { maxWidth: 'xs', cols: 1, spacing: 'sm' }
      ]}
      style={{ border: '1px solid violet', width: '100%' }}
    >
      <div>
        <h3>Receips List</h3>
        {table}
      </div>
      <div>
        <Outlet />
      </div>
    </SimpleGrid>
  )
}

export default ReceiptList
