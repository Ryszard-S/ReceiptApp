import { Autocomplete, Button, createStyles, Divider, NativeSelect, NumberInput, ScrollArea, Table, TextInput } from '@mantine/core'
import React, { Fragment, useEffect, useState } from 'react'
import axiosPrivateInstance from '../utils/axiosPrivateInstance'
import { DatePicker } from '@mantine/dates'
import { showNotification } from '@mantine/notifications'

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

function Receipts() {
  const [shopList, setShopList] = useState([])
  const [currentShop, setCurrentShop] = useState('')
  const [currentCategoriesList, setCurrentCategoriesList] = useState([])
  const [currentItemsList, setCurrentItemsList] = useState([])
  const [itemName, setItemName] = useState('')
  const [itemPrice, setItemPrice] = useState(0)
  const [itemCategory, setItemCategory] = useState('')
  const { classes, cx } = useStyles()
  const [scrolled, setScrolled] = useState(false)
  const [date, setDate] = useState()

  useEffect(
    () => async () => {
      const res = await axiosPrivateInstance.get('/')
      setShopList(() => res.data.map((shop) => shop.name))
      const cat = await axiosPrivateInstance.get('/receipts/category')
      setCurrentCategoriesList(() => cat.data.map((c) => c.name))
    },
    []
  )

  const submitReceipt = async (e) => {
    e.preventDefault()
    const items = currentItemsList.map((item) => ({
      name: item.name,
      price: item.price,
      category: {name: item.category}}))
    try {
      const res = await axiosPrivateInstance.post('receipts/create/', {
        shop:{name: currentShop},
        date: `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`,
        items: items,
      })
      console.log(res)
      showNotification({ message: 'Receipt added', color: 'green' })
      
    } catch(error){
      console.log(error)
      showNotification({ message: 'Error', color: 'red' })
    }

    console.log(items)
  }

  const addNewItem = () => {
    setCurrentItemsList([...currentItemsList, { name: itemName, price: itemPrice, category: itemCategory }])
    setItemName('')
    setItemCategory('')
    setItemPrice(0)
  }
  const rows = currentItemsList.map((item, index) => (
    <tr key={index}>
      <td>{index + 1}</td>
      <td>{item.name}</td>
      <td>{item.price}</td>
      <td>{item.category}</td>
      <td>
        <Button
          onClick={() => {
            console.log(index)
          }}
        >
          Delete
        </Button>
      </td>
    </tr>
  ))

  return (
    <Fragment>
      <form>
        <Autocomplete label="Shop name" placeholder="Pick one" data={shopList} onChange={setCurrentShop} />
        <DatePicker placeholder="Pick date" label="Event date" onChange={setDate} mb={'xl'} />
        <Divider my="xs" label="Items" labelPosition="center" mt={'xl'} />
        <TextInput label="Item name" placeholder="Item name" onChange={(e) => setItemName(e.target.value)} value={itemName} />
        <NumberInput label="Price" precision={2} step={0.01} onChange={(e) => setItemPrice(e)} value={itemPrice} />
        <NativeSelect data={currentCategoriesList} placeholder="Pick one" label="Category" onChange={(e) => setItemCategory(e.target.value)} value={itemCategory} required />
        <Button
          onClick={() => {
            addNewItem()
          }}
        >
          Add item
        </Button>
        <ScrollArea sx={{ height: 400 }} onScrollPositionChange={({ y }) => setScrolled(y !== 0)}>
          <Table sx={{ minWidth: 700 }}>
            <thead className={cx(classes.header, { [classes.scrolled]: scrolled })}>
              <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Price</th>
                <th>Category</th>
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

export default Receipts
