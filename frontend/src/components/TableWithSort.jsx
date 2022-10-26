import { Center, Group, ScrollArea, Table, Text, UnstyledButton, createStyles } from '@mantine/core'
import { keys } from '@mantine/utils'
import { IconChevronDown, IconChevronUp, IconSelector } from '@tabler/icons'
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

function sortData(data, payload) {
  const { sortBy } = payload
  console.log(payload)

  if (!sortBy) {
    return data
  }
  if (payload.dataType === 'number') {
    console.log('number')
    return data.sort((a, b) => {
      if (payload.reversed) {
        return a[sortBy] - b[sortBy]
      } else {
        return b[sortBy] - a[sortBy]
      }
    })
  }
  if (payload.dataType === 'date') {
    console.log('date')
    return data.sort((a, b) => {
      if (payload.reversed) {
        return a[sortBy] - b[sortBy]
      } else {
        return b[sortBy] - a[sortBy]
      }
    })
  } else
    return data.sort((a, b) => {
      if (payload.reversed) {
        return b[sortBy].localeCompare(a[sortBy])
      }

      return a[sortBy].localeCompare(b[sortBy])
    })
}

export function TableWithSort({ data, onClick }) {
  console.log('data', data)
  const tableTitle = keys(data[0])
  const [sortedData, setSortedData] = useState(data)
  const [sortBy, setSortBy] = useState(null)
  const [reverseSortDirection, setReverseSortDirection] = useState(false)

  const setSorting = (field, dataType) => {
    const reversed = field === sortBy ? !reverseSortDirection : false
    setReverseSortDirection(reversed)
    setSortBy(field)
    setSortedData(sortData(data, { sortBy: field, reversed, dataType }))
  }

  const rows = sortedData.map((row) => {
    console.log(row)
    // console.log(row[tableTitle[1]].toLocaleDateString())
    return (
      <tr id={row[tableTitle[0]]} key={row[tableTitle[0]]} onClick={onClick} style={{ cursor: 'pointer' }}>
        {tableTitle.map((title) => {
          if (checkDataType(row[title]) === 'date') {
            return <td>{row[title].toLocaleDateString()}</td>
          }

          return <td>{row[title].toString()}</td>
        })}
      </tr>
    )
  })

  return (
    <ScrollArea>
      <Table highlightOnHover horizontalSpacing="md" verticalSpacing="xs" sx={{ tableLayout: 'fixed' }}>
        <thead>
          <tr>
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
