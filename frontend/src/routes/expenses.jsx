import { Center, Group, SimpleGrid, Table, Text, TextInput, UnstyledButton, createStyles } from '@mantine/core'
import { IconChevronDown, IconChevronUp, IconSearch, IconSelector } from '@tabler/icons'
import { ArcElement, BarElement, CategoryScale, Chart as ChartJS, Legend, LinearScale, Title, Tooltip } from 'chart.js'
import { useMemo, useState } from 'react'
import { useEffect } from 'react'
import React from 'react'
import { Bar, Pie } from 'react-chartjs-2'

import { TableWithSort } from '../components/TableWithSort'
import { useGetCategoriesQuery } from '../features/categories/categoriesApiSlice'
import { useGetReceiptsQuery } from '../features/receipts/receiptsApiSlice'
import useTitle from '../hooks/useTitle'

let z = (ids, receipts) => {
  let y = []
  let categories = []
  // // extract categories from receipts
  //   for (let i = 0; i < receipts.length; i++) {
  //     for (let j = 0; j < receipts[i].categories.length; j++) {
  //       if (!categories.includes(receipts[i].categories[j])) {
  //         categories.push(receipts[i].categories[j])
  //       }
  //     }
  //   }
  // // create array of objects with category and total
  //   for (let i = 0; i < categories.length; i++) {
  //     let total = 0

  //     for (let j = 0; j < receipts.length; j++) {
  //       for (let k = 0; k < receipts[j].categories.length; k++) {
  //         if (categories[i] === receipts[j].categories[k]) {
  //           total += receipts[j].total
  //         }
  //       }
  //     }
  //     y.push({ category: categories[i], total: total })
  //   }
  //   return y
  // }

  ids?.forEach((id) => {
    receipts[id]?.items.forEach((i) => {
      if (categories.includes(i?.category?.name)) {
        return
      } else {
        categories.push(i?.category?.name)
      }
    })
  })

  // receipts?.forEatch((r) => {
  //     r?.items.forEach((i) => {
  //       if (categories.includes(i?.category?.name)) {
  //         return
  //       } else {
  //         categories.push(i?.category?.name)
  //       }
  //     })
  //   })

  console.log('categories', categories)
  categories.forEach((category) => {
    y.push({ name: category, sum: 0 })
  })
  console.log('categories after add  0', y)

  ids?.forEach((id) => {
    receipts[id]?.items.forEach((i) => {
      y.forEach((c) => {
        if (c.name === i?.category?.name) {
          c.sum += +i.price
        }
      })
    })
  })
  y.map((c) => {
    c.sum = Number(c.sum.toFixed(2))
    return { name: c.name, sum: c.sum }
  })
  console.log('categories after add sum', y)
  // receipts?.forEach((receipt) => {
  //   receipt.items.forEach((item) => {
  //     y.forEach((category) => {
  //       if (item.category.name === category.name) {
  //         category.sum += +item.price
  //       }
  //     })
  //   })
  // }
  // )
  return y
}

function Expenses() {
  useTitle('Expenses')

  const { data: receiptsAPI = [], isLoading, isError, isSuccess } = useGetReceiptsQuery({})

  const [receipts, setReceipts] = useState([])

  const memoizedReceipts = useMemo(() => {
    const { ids, entities } = receiptsAPI
    console.log('entities', entities)
    console.log('ids', ids)
    // const cat = categories.slice()
    const sumCategories = z(ids, entities)
    // console.log('memo')
    return sumCategories
  }, [isSuccess])

  const randomColor = () => `rgba(${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, 0.5)`

  ChartJS.register(ArcElement, Tooltip, Legend, CategoryScale, LinearScale, BarElement, Title)

  let content = <div></div>

  if (isSuccess) {
    const options = {
      responsive: true,
      plugins: { legend: { display: false } }
    }
    const data = {
      labels: memoizedReceipts.map((receipt) => receipt.name),
      datasets: [
        {
          data: memoizedReceipts.map((receipt) => receipt.sum),
          backgroundColor: memoizedReceipts.map(() => randomColor()),
          borderColor: ['rgba(215, 215, 215, 0.8)'],
          hoverBorderColor: ['rgba(152, 152, 152, 0.8)']
        }
      ]
    }

    content = (
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
          <TableWithSort data={memoizedReceipts} />
        </div>
        <div style={{ width: '100%' }}>
          {/* <Pie data={data} /> */}
          <Bar options={options} data={data} />
        </div>
      </SimpleGrid>
    )
  }

  return content
}

export default Expenses
