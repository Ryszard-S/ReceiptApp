import { Center, Group, ScrollArea, Table, Text, TextInput, UnstyledButton, createStyles } from '@mantine/core'
import { keys } from '@mantine/utils'
import { IconChevronDown, IconChevronUp, IconSearch, IconSelector } from '@tabler/icons'
import { useState } from 'react'
import React from 'react'

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

function Th({ children, reversed, sorted, onSort }) {
  const { classes } = useStyles()
  const Icon = sorted ? (reversed ? IconChevronUp : IconChevronDown) : IconSelector
  return (
    <th className={classes.th}>
      <UnstyledButton onClick={onSort} className={classes.control}>
        <Group position="apart">
          <Text weight={500} size="sm">
            {children}
          </Text>
          <Center className={classes.icon}>
            <Icon size={14} stroke={1.5} />
          </Center>
        </Group>
      </UnstyledButton>
    </th>
  )
}

const checkDataType = (data) => {
  if (typeof data === 'string') {
    return 'string'
  } else if (typeof data === 'number') {
    return 'number'
  } else if (typeof data === 'boolean') {
    return 'boolean'
  } else if (data instanceof Date) {
    return 'date'
  } else if (typeof data === 'object') {
    return 'object'
  } else {
    return 'undefined'
  }
}

function filterData(data, search) {
  const keysToSearch = ['shop']
  console.log('keysToSearch', keysToSearch)
  const query = search.toLowerCase().trim()
  const resoults = data.filter((item) => keysToSearch.some((key) => item[key].toLowerCase().includes(query)))
  //   return data.filter((item) => keys(data[0]).some((key) => item[key].toLowerCase().includes(query)))
  return resoults
}

function sortData(data, payload) {
  const { sortBy } = payload
  console.log(payload)

  if (!sortBy) {
    return filterData(data, payload.search)
  }
  if (payload.dataType === 'number') {
    console.log('number')
    return filterData(data, payload.search).sort((a, b) => {
      if (payload.reversed) {
        return a[sortBy] - b[sortBy]
      } else {
        return b[sortBy] - a[sortBy]
      }
    })
  }
  if (payload.dataType === 'date') {
    console.log('date')
    return filterData(data, payload.search).sort((a, b) => {
      if (payload.reversed) {
        return a[sortBy] - b[sortBy]
      } else {
        return b[sortBy] - a[sortBy]
      }
    })
  } else
    return filterData(
      [...data].sort((a, b) => {
        if (payload.reversed) {
          return b[sortBy].localeCompare(a[sortBy])
        }

        return a[sortBy].localeCompare(b[sortBy])
      }),
      payload.search
    )
}

export function TableSort({ data }) {
  console.log('data', data)
  const tableTitle = keys(data[0])
  const [search, setSearch] = useState('')
  const [sortedData, setSortedData] = useState(data)
  const [sortBy, setSortBy] = useState(null)
  const [reverseSortDirection, setReverseSortDirection] = useState(false)

  const setSorting = (field, dataType) => {
    const reversed = field === sortBy ? !reverseSortDirection : false
    setReverseSortDirection(reversed)
    setSortBy(field)
    setSortedData(sortData(data, { sortBy: field, reversed, search, dataType }))
  }

  const handleSearchChange = (event) => {
    const { value } = event.currentTarget
    setSearch(value)
    setSortedData(sortData(data, { sortBy, reversed: reverseSortDirection, search: value }))
  }

  const rows = sortedData.map((row) => {
    console.log(row)
    console.log(row[tableTitle[1]].toLocaleDateString())
    return (
      <tr key={row[tableTitle[0]]}>
        {tableTitle.map((title) => {
          if (checkDataType(row[title]) === 'date') {
            return <td>{row[title].toLocaleDateString()}</td>
          }

          return <td>{row[title].toString()}</td>
        })}
        {/* <td>{row[tableTitle[0]].toString()}</td>
        <td>{row[tableTitle[1]].toString()}</td>
        <td>{row[tableTitle[2]].toString()}</td>
        <td>{row[tableTitle[3]].toString()}</td> */}
      </tr>
    )
  })

  //   const type = checkDataType(data[0][title])
  //   if (type === 'date') {
  //     console.log('date', title.toLocaleString())
  //     return (
  //       <Th sorted={sortBy === title} reversed={reverseSortDirection} onSort={() => setSorting(title, type)} key={index}>
  //         {title.toLocaleString()}
  //       </Th>
  //     )
  //   }

  //   const checkDataType = (data) => {
  //     if (typeof data === 'string') {
  //       return 'string'
  //     } else if (typeof data === 'number') {
  //       return 'number'
  //     } else if (typeof data === 'boolean') {
  //       return 'boolean'
  //     } else if (data instanceof Date) {
  //       return 'date'
  //     } else if (typeof data === 'object') {
  //       return 'object'
  //     } else {
  //       return 'undefined'
  //     }
  //   }

  return (
    <ScrollArea>
      <TextInput placeholder="Search by any field" mb="md" icon={<IconSearch size={14} stroke={1.5} />} value={search} onChange={handleSearchChange} />
      <Table horizontalSpacing="md" verticalSpacing="xs" sx={{ tableLayout: 'fixed', minWidth: 700 }}>
        <thead>
          <tr>
            {/* <Th sorted={sortBy === tableTitle[0]} reversed={reverseSortDirection} onSort={() => setSorting(tableTitle[0])}>
              {tableTitle[0]}
            </Th>
            <Th sorted={sortBy === tableTitle[1]} reversed={reverseSortDirection} onSort={() => setSorting(tableTitle[1])}>
              {tableTitle[1]}
            </Th>
            <Th sorted={sortBy === tableTitle[2]} reversed={reverseSortDirection} onSort={() => setSorting(tableTitle[2])}>
              {tableTitle[2]}
            </Th>
            <Th sorted={sortBy === tableTitle[3]} reversed={reverseSortDirection} onSort={() => setSorting(tableTitle[3])}>
              {tableTitle[3]}
            </Th> */}
            {tableTitle.map((title, index) => {
              const type = checkDataType(data[0][title])
              return (
                <Th sorted={sortBy === title} reversed={reverseSortDirection} onSort={() => setSorting(title, type)} key={index}>
                  {title}
                </Th>
              )
            })}
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
    </ScrollArea>
  )
}
