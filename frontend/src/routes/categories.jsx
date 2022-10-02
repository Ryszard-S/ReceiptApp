import { Button, createStyles, ScrollArea, Table, TextInput } from '@mantine/core'
import React, { Fragment, useEffect, useState } from 'react'
import axiosPrivateInstance from '../utils/axiosPrivateInstance'
import { showNotification } from '@mantine/notifications'
import { useGetCategoriesQuery, useAddNewCategoryMutation } from '../features/categories/categoriesApiSlice'

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
  const [categories, setCategories] = useState([])
  const [newCategorie, setNewCategorie] = useState('')

  const { data: categoriess, isLoading, isError, isSuccess } = useGetCategoriesQuery()
  const [addNewCategory, { isLoading: isAdding, isSuccess: isAdded, isError: isAddError }] = useAddNewCategoryMutation()

  let content

  const deleteCategory = async (id) => {
    try {
      await axiosPrivateInstance.delete(`/receipts/category/${id}/delete`)
      showNotification({ message: 'Category deleted', color: 'orange' })
      setCategories(categories.filter((c) => c.id !== id))
    } catch (error) {
      console.log(error)
      showNotification({ message: 'Error deleting category', color: 'red' })
    }
  }

  const addCategory = async () => {
    // try {
    //   const res = await axiosPrivateInstance.post(`/receipts/category/`, { name: newCategorie })
    //   console.log(res)

    //   console.log(categories.filter((c) => c.id === res.data.id))
    //   if (categories.filter((c) => c.id === res.data.id).length === 0) {
    //     setCategories([...categories, res.data])
    //     showNotification({ message: 'Category added', color: 'green' })
    //   } else {
    //     showNotification({ message: 'Category already existing', color: 'pink' })
    //   }
    // } catch (error) {
    //   console.log(error)
    //   showNotification({ message: 'Error adding category', color: 'red' })
    // }
    try {
      addNewCategory({ name: newCategorie })
      if (isAdded) {
        showNotification({ message: 'Category added', color: 'green' })
      }
    } catch (error) {
      console.log(error)
      showNotification({ message: 'Error adding category', color: 'red' })
    }
  }

  if (isSuccess) {
    console.log(categoriess)

    const rows = categoriess.map((row) => (
      <tr key={row.id}>
        <td>{row.id}</td>
        <td>{row.name}</td>
        <td>
          <Button
            onClick={() => {
              deleteCategory(row.id)
            }}
          >
            Delete
          </Button>
        </td>
      </tr>
    ))

    content = (
      <Fragment>
        <ScrollArea sx={{ height: 600 }} onScrollPositionChange={({ y }) => setScrolled(y !== 0)}>
          <Table sx={{ minWidth: 700 }}>
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
