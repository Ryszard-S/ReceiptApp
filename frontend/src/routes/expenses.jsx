import { useState } from 'react'
import { useEffect } from 'react'
import axiosPrivateInstance from '../utils/axiosPrivateInstance'

function Expenses() {
  const [receipts, setReceipts] = useState([])
  const [categories, setCategories] = useState([])
  useEffect(() => {
    const fetchData = async () => {
      const res = await axiosPrivateInstance.get('receipts')
      setReceipts(res.data)
      const cat = await axiosPrivateInstance.get('receipts/category')
      setCategories(cat.data)
    }
    fetchData()
  }, [])
  return (
    <div>
      {receipts.map((r) => (
        <div>{r.id}</div>
      ))}
    </div>
  )
}

export default Expenses
