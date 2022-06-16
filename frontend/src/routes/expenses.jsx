import { useState } from 'react'
import { useEffect } from 'react'
import axiosPrivateInstance from '../utils/axiosPrivateInstance'
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js'
import { Pie } from 'react-chartjs-2'

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
    const sss = await Promise.all([axiosPrivateInstance.get('receipts'), axiosPrivateInstance.get('receipts/category/')])
    // console.log(sss[0].data, sss[1].data)
    const sumCategories = z(sss[0].data, sss[1].data)
    setReceipts(sumCategories)
  }

  useEffect(() => {
    fetchData()
  }, [])

  ChartJS.register(ArcElement, Tooltip, Legend)
  const data = {
    labels: receipts.map((receipt) => receipt.name),
    datasets: [
      {
        label: '# of Votes',
        data: receipts.map((receipt) => receipt.sum),
        backgroundColor: ['rgba(255, 99, 132, 0.9)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)'],
        borderColor: ['rgba(215, 215, 215, 0.8)'],
        hoverBorderColor: ['rgba(152, 152, 152, 0.8)'],
      }
    ]
  }

  return (
    <div>
      {receipts.map((r) => (
        <div key={r.name}>
          <div>{r.name}</div>
          <div>{r.sum}</div>
          <br />
        </div>
      ))}
      <p>From categories</p>
      {categories.map((c) => (
        <div>{c.name}</div>
      ))}
      <Pie data={data} />
    </div>
  )
}

export default Expenses
