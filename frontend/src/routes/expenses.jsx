import { Center, Group, SimpleGrid, Table, Text, TextInput, UnstyledButton, createStyles } from '@mantine/core'
import { ArcElement, Chart as ChartJS, Legend, Tooltip } from 'chart.js'
import { useState } from 'react'
import { useEffect } from 'react'
import React from 'react'
import { Pie } from 'react-chartjs-2'
import { ChevronDown, ChevronUp, Search, Selector } from 'tabler-icons-react'

import axiosPrivateInstance from '../utils/axiosPrivateInstance'

const useStyles = createStyles((theme) => ({
  th: {
    padding: '0 !important',
    '&:hover': {
      backgroundColor: theme.colorScheme === 'dark' ? theme.colors.dark[6] : theme.colors.gray[0]
    }
  },

  control: {
    width: '100%',
    padding: `${theme.spacing.xs}px ${theme.spacing.md}px`,

    '&:hover': {
      backgroundColor: theme.colorScheme === 'dark' ? theme.colors.dark[6] : theme.colors.gray[0]
    }
  },

  icon: {
    width: 21,
    height: 21,
    borderRadius: 21
  }
}))

function Th({ children, reversed, sorted, onSort }) {
  const { classes } = useStyles()
  const Icon = sorted ? (reversed ? ChevronUp : ChevronDown) : Selector
  return (
    <th className={classes.th}>
      <UnstyledButton onClick={onSort} className={classes.control}>
        <Group position="apart">
          <Text weight={500} size="sm">
            {children}
          </Text>
          <Center className={classes.icon}>
            <Icon size={14} />
          </Center>
        </Group>
      </UnstyledButton>
    </th>
  )
}

function filterData(data, search) {
  const keys = ['name']
  const query = search.toLowerCase().trim()
  console.log(keys, query)
  return data.filter((item) => keys.some((key) => item[key].toLowerCase().includes(query)))
}

function sortData(data, payload) {
  console.log(payload)
  console.log(payload.isNumber)
  if (!payload.sortBy) {
    console.log('no sortBy')
    return filterData(data, payload.search)
  }
  if (payload.isNumber) {
    console.log('wykonuje isNumber')
    return filterData(
      [...data].sort((a, b) => {
        if (payload.reversed) {
          return b[payload.sortBy] - a[payload.sortBy]
        }

        return a[payload.sortBy] - b[payload.sortBy]
      }),
      payload.search
    )
  }
  console.log('wykonuje rest')
  return filterData(
    [...data].sort((a, b) => {
      if (payload.reversed) {
        return b[payload.sortBy].localeCompare(a[payload.sortBy])
      }
      return a[payload.sortBy].localeCompare(b[payload.sortBy])
    }),
    payload.search
  )
}

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

function Expenses() {
  const [search, setSearch] = useState('')
  const [sortBy, setSortBy] = useState(null)
  const [reverseSortDirection, setReverseSortDirection] = useState(false)

  const [receipts, setReceipts] = useState([])

  const fetchData = async () => {
    const sss = await Promise.all([axiosPrivateInstance.get('receipts'), axiosPrivateInstance.get('receipts/category/')])
    const sumCategories = z(sss[0].data, sss[1].data)
    setReceipts(sumCategories)
  }
  const randomColor = () => `rgba(${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, 0.5)`

  useEffect(() => {
    fetchData()
  }, [])

  const setSorting = (field, isNumber = false) => {
    const reversed = field === sortBy ? !reverseSortDirection : false
    setReverseSortDirection(reversed)
    setSortBy(field)
    setReceipts((receipt) => sortData(receipt, { sortBy: field, reversed, search, isNumber }))
  }

  const handleSearchChange = (event) => {
    const { value } = event.currentTarget
    setSearch(value)
    setReceipts((receipt) => sortData(receipt, { sortBy, reversed: reverseSortDirection, search: value, isNumber: true }))
  }

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
        <TextInput placeholder="Search by any field" mb="md" icon={<Search size={14} />} value={search} onChange={handleSearchChange} />
        <Table horizontalSpacing="md" verticalSpacing="xs" sx={{ tableLayout: 'fixed' }}>
          <thead>
            <tr>
              <th>Id</th>
              <Th sorted={sortBy === 'name'} reversed={reverseSortDirection} onSort={() => setSorting('name')}>
                Name
              </Th>
              <Th sorted={sortBy === 'sum'} reversed={reverseSortDirection} onSort={() => setSorting('sum', true)}>
                Sum
              </Th>
            </tr>
          </thead>
          <tbody>
            {rows.length > 0 ? (
              rows
            ) : (
              <tr>
                <td>
                  <Text weight={500} align="center">
                    Nothing found
                  </Text>
                </td>
              </tr>
            )}
          </tbody>
        </Table>
      </div>
      <div style={{ width: '100%' }}>
        <Pie data={data} />
      </div>
    </SimpleGrid>
  )
}

export default Expenses
