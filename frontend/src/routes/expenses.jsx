import { useState } from 'react'
import { useEffect } from 'react'
import axiosPrivateInstance from '../utils/axiosPrivateInstance'

function Expenses() {
  const [receipts, setReceipts] = useState([])
  const [categories, setCategories] = useState([])

  let z = (rec, cat) => {
    let y = []
    cat.forEach((category) => {
      y.push({ name: category.name, sum: 0 })
    })
    rec.forEach((receipt) => {
      receipt.items.forEach((item) => {
        y.forEach((category) => {
          if (item.category.name === category.name) {
            category.sum += +item.price
          }
        })
      })
    })
    return y
  }

  const fetchData = async () => {
    await axiosPrivateInstance
      .get('receipts')
      .then((response) => {
        setReceipts(response.data)
        console.log('receipts e', response.data)
      })
      .catch((error) => {
        console.log(error)
      })

    await axiosPrivateInstance
      .get('receipts/category/')
      .then((response) => {
        console.log('re', response.data)
        setCategories(response.data)
        console.log('categories e', response.data)
        return response.data
      })
      .then((res) => {
        setReceipts((receipts) => z(receipts, res))
      })
      .catch((error) => {
        console.log(error)
      })
    
    console.log('receipts', receipts)
    console.log('categories', categories)
  }

  useEffect(() => {
    fetchData()
  }, [])

  return (
    <div>
      {receipts.map((r) => (
        <div>
          <div>{r.name}</div>
          <div>{r.sum}</div>
          <br />
        </div>
      ))}
      <p>From categories</p>
      {categories.map((c) => (
        <div>{c.name}</div>
      ))}
    </div>
  )
}

export default Expenses
