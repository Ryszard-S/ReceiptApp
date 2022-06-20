import React, { Fragment, useState } from 'react'
import { createStyles, Table, ScrollArea, UnstyledButton, Group, Text, Center, TextInput, SimpleGrid, Burger } from '@mantine/core'
import { Selector, ChevronDown, ChevronUp, Search } from 'tabler-icons-react'

const useStyles = createStyles((theme) => ({
  th: {
    padding: '0 !important'
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

const data = [
  { name: 'new', sum: 875.97 },
  { name: 'newcategory', sum: 123.0 },
  { name: 'or not !', sum: 1468.35 },
  { name: 'butcha', sum: 123875.97 }
]

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
  return data.filter((item) => keys.some((key) => item[key].includes(query)))
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

function Test() {
  const [search, setSearch] = useState('')
  const [sortedData, setSortedData] = useState(data)
  const [sortBy, setSortBy] = useState(null)
  const [reverseSortDirection, setReverseSortDirection] = useState(false)

  const [opened, setOpened] = useState(false)
  const title = opened ? 'Close navigation' : 'Open navigation'

  const setSorting = (field, isNumber) => {
    const reversed = field === sortBy ? !reverseSortDirection : false
    setReverseSortDirection(reversed)
    setSortBy(field)
    setSortedData(sortData(data, { sortBy: field, reversed, search, isNumber }))
  }

  const handleSearchChange = (event) => {
    const { value } = event.currentTarget
    setSearch(value)
    setSortedData(sortData(data, { sortBy, reversed: reverseSortDirection, search: value }))
  }

  const rows = sortedData.map((row, id) => (
    <tr key={row.name}>
      <td>{id + 1}</td>
      <td>{row.name}</td>
      <td>{row.sum}</td>
    </tr>
  ))

  return (
    <SimpleGrid
      cols={4}
      spacing="lg"
      breakpoints={[
        { maxWidth: 'md', cols: 3, spacing: 'md' },
        { maxWidth: 'sm', cols: 2, spacing: 'sm' },
        { maxWidth: 'xs', cols: 1, spacing: 'sm' }
      ]}
      style={{ border: '1px solid violet' }}
    >
      <Burger opened={opened} onClick={() => setOpened((o) => !o)} title={title} />
      {opened && (
        <Fragment>
          <div style={{ border: '1px solid red' }}>1</div>
          <div style={{ border: '1px solid red' }}>2</div>
        </Fragment>
      )}

      <div style={{ border: '1px solid red' }}>3</div>
      <div style={{ border: '1px solid red' }}>4</div>
      <div style={{ border: '1px solid red' }}>5</div>
      {/* <ScrollArea>
      <TextInput placeholder="Search by any field" mb="md" icon={<Search size={14} />} value={search} onChange={handleSearchChange} />
      <Table horizontalSpacing="md" verticalSpacing="xs" sx={{ tableLayout: 'fixed' , minWidth: 700}}>
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
              <td colSpan={Object.keys(data[0]).length}>
                <Text weight={500} align="center">
                  Nothing found
                </Text>
              </td>
            </tr>
          )}
        </tbody>
      </Table>
    </ScrollArea>  */}
    </SimpleGrid>
  )
}

export default Test
