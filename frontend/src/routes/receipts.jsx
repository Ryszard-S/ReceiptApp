import { Autocomplete, Button, Divider, NativeSelect, NumberInput, ScrollArea, Table, TextInput, createStyles } from '@mantine/core'
import { DatePicker } from '@mantine/dates'
import { showNotification } from '@mantine/notifications'
import React, { Fragment, useEffect, useState } from 'react'

import ButtonDelete from '../components/buttonDelete'
import { useGetCategoriesQuery } from '../features/categories/categoriesApiSlice'
import { useAddReceiptMutation } from '../features/receipts/receiptsApiSlice'
import { useGetShopsQuery } from '../features/shops/shopsApiSlice'
import useTitle from '../hooks/useTitle'

const useStyles = createStyles((theme) => ({
  header: {
    position: 'sticky',
    top: 0,
    backgroundColor: theme.white,
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

function Receipts() {
  useTitle('Receipts')
  const [currentShop, setCurrentShop] = useState('')
  const [currentItemsList, setCurrentItemsList] = useState([])
  const [itemName, setItemName] = useState('')
  const [itemPrice, setItemPrice] = useState(0)
  const [itemCategory, setItemCategory] = useState('')
  const { classes, cx } = useStyles()
  const [scrolled, setScrolled] = useState(false)
  const [date, setDate] = useState()
  const [errorInput, setErrorInput] = useState({
    itemNameError: { error: false, message: 'at least one character' },
    itemPriceError: { error: false, message: 'price 0' },
    itemCategoryError: { error: false, message: 'select category' }
  })

  const { data: shops, isLoading, isError, isSuccess } = useGetShopsQuery({})
  const { data: categories, isLoading: isCategoriesLoading, isError: isCategoriesError, isSuccess: isCategoriesSuccess } = useGetCategoriesQuery({})
  const [addReceipt, { isLoading: isAdding, isSuccess: isAdded, isError: isAddError }] = useAddReceiptMutation()
  useEffect(() => {
    console.log(errorInput)
  }, [errorInput])

  const submitReceipt = async (e) => {
    e.preventDefault()
    const items = currentItemsList.map((item) => ({
      name: item.name,
      price: item.price,
      category: { name: item.category }
    }))
    try {
      const res = await addReceipt({
        shop: { name: currentShop },
        date: `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`,
        items: items
      }).unwrap()
      console.log(res)
      showNotification({ message: 'Receipt added', color: 'green' })
    } catch (error) {
      console.log(error)
      showNotification({ message: 'Error', color: 'red' })
    }

    console.log(items)
  }

  const addNewItem = () => {
    // if (itemName.length < 3) {
    //   console.log('error less than 4')
    //   setErrorInput((error) => {
    //     return { ...error, itemNameError: { error: true, message: 'at least 3 characters' } }
    //   })

    //   return
    // } else {
    //   setErrorInput((error) => {
    //     return { ...error, itemNameError: { error: false } }
    //   })
    // }

    // if (itemPrice < 0.01) {
    //   setErrorInput((error) => {
    //     return { ...error, itemPriceError: { error: true, message: 'Price must be at lest 0.01' } }
    //   })
    //   return
    // } else {
    //   setErrorInput((error) => {
    //     return { ...error, itemPriceError: { error: false } }
    //   })
    // }
    // if (itemCategory.length < 1) {
    //   setErrorInput((error) => {
    //     return { ...error, itemCategoryError: { error: true, message: 'Choose category' } }
    //   })
    //   return
    // } else {
    //   setErrorInput((error) => {
    //     return { ...error, itemCategoryError: { error: false } }
    //   })
    // }

    setCurrentItemsList([...currentItemsList, { name: itemName, price: itemPrice, category: itemCategory }])
    setItemName('')
    setItemCategory('')
    setItemPrice(0)
  }

  let content = <Fragment />

  const rows = currentItemsList.map((item, index) => (
    <tr key={index}>
      <td>{index + 1}</td>
      <td>{item.name}</td>
      <td>{item.price}</td>
      <td>
        <div> </div>
        {item.category}
      </td>
      <td>
        <ButtonDelete
          sx={{ position: 'static' }}
          onClick={() => {
            setCurrentItemsList(currentItemsList.filter((_, i) => i !== index))

            console.log(index)
          }}
        />
      </td>
    </tr>
  ))

  if (isLoading) {
    content = <div>Loading...</div>
  }
  if (isSuccess && isCategoriesSuccess) {
    content = (
      <Fragment>
        <form>
          <Autocomplete label="Shop name" placeholder="Pick one" data={shops.map((shop) => shop.name)} onChange={setCurrentShop} />
          <DatePicker placeholder="Pick date" label="Event date" onChange={setDate} mb={'xl'} />
          <Divider my="xs" label="Items" labelPosition="center" mt={'xl'} />
          <TextInput
            error={errorInput.itemNameError.error && errorInput.itemNameError.message}
            label="Item name"
            placeholder="Item name"
            onChange={(e) => setItemName(e.target.value)}
            value={itemName}
          />
          <NumberInput error={errorInput.itemPriceError.error && errorInput.itemPriceError.message} label="Price" precision={2} step={0.01} onChange={(e) => setItemPrice(e)} value={itemPrice} />
          <NativeSelect
            error={errorInput.itemCategoryError.error && errorInput.itemCategoryError.message}
            data={categories.map((category) => category.name)}
            placeholder="Pick one"
            label="Category"
            onChange={(e) => setItemCategory(e.target.value)}
            value={itemCategory}
          />
          <Button
            onClick={() => {
              addNewItem()
            }}
          >
            Add item
          </Button>
          <ScrollArea sx={{ height: 300 }} onScrollPositionChange={({ y }) => setScrolled(y !== 0)}>
            <Table sx={{ minWidth: 700 }} highlightOnHover>
              <thead className={cx(classes.header, { [classes.scrolled]: scrolled })}>
                <tr>
                  <th>Id</th>
                  <th>Name</th>
                  <th>Price</th>
                  <th>Category</th>
                  <th>Delete</th>
                </tr>
              </thead>
              <tbody>{rows}</tbody>
            </Table>
          </ScrollArea>
          <Button type="submit" onClick={(e) => submitReceipt(e)}>
            Add Receipt
          </Button>
        </form>
      </Fragment>
    )
  }

  return content
}

export default Receipts
