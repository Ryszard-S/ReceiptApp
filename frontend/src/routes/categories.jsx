import { Button, ScrollArea, Table, TextInput, createStyles } from '@mantine/core'
import { showNotification } from '@mantine/notifications'
import React, { Fragment, useState } from 'react'

import ButtonDelete from '../components/buttonDelete'
import { useAddNewCategoryMutation, useDeleteCategoryMutation, useGetCategoriesQuery } from '../features/categories/categoriesApiSlice'
import useTitle from '../hooks/useTitle'

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

function Categories() {
  const { classes, cx } = useStyles()
  const [scrolled, setScrolled] = useState(false)
  const [newCategorie, setNewCategorie] = useState('')
  useTitle('Categories')

  const { data: categories, isLoading, isError, isSuccess } = useGetCategoriesQuery({})
  const [addNewCategory, { isLoading: isAdding, isSuccess: isAdded, isError: isAddError }] = useAddNewCategoryMutation()
  const [deleteCategory, { isLoading: isDeleting, isSuccess: isDeleted, isError: isDeleteError }] = useDeleteCategoryMutation()

  let content = <Fragment />

  const addCategory = async () => {
    try {
      addNewCategory({ name: newCategorie })
      if (isAdded) {
        showNotification({ message: 'Category added', color: 'green' })
      }
      setNewCategorie('')
    } catch (error) {
      console.log(error)
      showNotification({ message: 'Error adding category', color: 'red' })
    }
  }

  const onDeleteCategory = async (id) => {
    try {
      console.log('id', id)
      deleteCategory(id)
      if (isDeleted) {
        showNotification({ message: 'Category deleted', color: 'orange' })
      }
    } catch (error) {
      console.log(error)
      showNotification({ message: 'Error deleting category', color: 'red' })
    }
  }

  if (isSuccess) {
    const rows = categories.map((row, index) => (
      <tr key={row.id}>
        <td>{index + 1}</td>
        <td>{row.name}</td>
        <td>
          <ButtonDelete onClick={() => onDeleteCategory(row.id)} />
        </td>
      </tr>
    ))

    content = (
      <Fragment>
        <ScrollArea sx={{ height: 600 }} onScrollPositionChange={({ y }) => setScrolled(y !== 0)}>
          <Table sx={{ minWidth: 400 }}>
            <thead className={cx(classes.header, { [classes.scrolled]: scrolled })}>
              <tr>
                <th>Id</th>
                <th>Name</th>
              </tr>
            </thead>
            <tbody>{rows}</tbody>
          </Table>
        </ScrollArea>
        <TextInput placeholder="Add new category" value={newCategorie} onChange={(event) => setNewCategorie(event.currentTarget.value)} />
        <Button onClick={addCategory}>Add</Button>
      </Fragment>
    )
  }

  return content
}

export default Categories
