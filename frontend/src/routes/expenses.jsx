import React from 'react'
import { useEffect } from 'react'
import axiosPrivateInstance from '../utils/axiosPrivateInstance'

function Expenses() {
  const [receipts, setReceipts] = React.useState([])
  useEffect(
    () => async () => {
      const res = await axiosPrivateInstance.get('receipts')
      setReceipts(await res.data)
      console.log('res', typeof(res.data))
      console.log('receipts', receipts)
      receipts.forEach((r) => console.log(r))
    },
    []
  )
  return <div>Expense s</div>
}

export default Expenses
