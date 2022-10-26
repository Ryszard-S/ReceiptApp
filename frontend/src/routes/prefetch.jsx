import React, { useEffect } from 'react'
import { Outlet } from 'react-router-dom'

import { store } from '../app/store'
import { categoriesApiSlice } from '../features/categories/categoriesApiSlice'
import { receiptsApiSlice } from '../features/receipts/receiptsApiSlice'

const Prefetch = () => {
  useEffect(() => {
    store.dispatch(receiptsApiSlice.util.prefetch('getReceipts', 'receiptList', { force: true }))
    store.dispatch(categoriesApiSlice.util.prefetch('getCategories', 'categoriesList', { force: true }))
  }, [])
  return <Outlet />
}

export default Prefetch
