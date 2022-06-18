import { useState } from 'react'
import { useEffect } from 'react'
import axiosPrivateInstance from '../utils/axiosPrivateInstance'
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js'
import { Pie } from 'react-chartjs-2'
import { createStyles, ScrollArea, Table } from '@mantine/core'

const useStyles = createStyles((theme) => ({
  header: {
    position: 'sticky',
    top: 0,
    backgroundColor: theme.colorScheme === 'dark' ? theme.colors.dark[7] : theme.white,
    transition: 'box-shadow 150ms ease',

    '&::after': {
      content: '""',
      position: 'absolute',
      left: 0,
      right: 0,
      bottom: 0,
      borderBottom: `1px solid ${theme.colorScheme === 'dark' ? theme.colors.dark[3] : theme.colors.gray[2]}`
    }
  },

  scrolled: {
    boxShadow: theme.shadows.sm
  }
}))

function Expenses() {
  const { classes, cx } = useStyles()
  const [scrolled, setScrolled] = useState(false)
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
    const sumCategories = z(sss[0].data, sss[1].data)
    setReceipts(sumCategories)
  }
  const randomColor = () => `rgba(${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, 0.5)`

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
        backgroundColor: receipts.map(() => randomColor()),
        borderColor: ['rgba(215, 215, 215, 0.8)'],
        hoverBorderColor: ['rgba(152, 152, 152, 0.8)']
      }
    ]
  }

  const rows = receipts.map((row, id) => (
    <tr key={id}>
      <td>{id + 1}</td>
      <td>{row.name}</td>
      <td>{row.sum}</td>
    </tr>
  ))

  return (
    <div>
      <ScrollArea onScrollPositionChange={({ y }) => setScrolled(y !== 0)}>
        <Table sx={{ minWidth: 700 }}>
          <thead className={cx(classes.header, { [classes.scrolled]: scrolled })}>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Sum</th>
            </tr>
          </thead>
          <tbody>{rows}</tbody>
        </Table>
      </ScrollArea>
      <Pie data={data} />
    </div>
  )
}

export default Expenses
