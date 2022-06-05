import React, { Fragment } from 'react'
import { Route, Routes } from 'react-router-dom'
import { Sidebar } from '../components/sidebar'
import Expenses from './expenses'
import Categories from './categories'
import Receipts from './receipts'

function Jr() {
  return (
    <div style={{ display: 'flex' }}>
      <Sidebar />
      <Routes>
        <Route path="/expenses" element={<Expenses />} />
        <Route path="/categories" element={<Categories />} />
        <Route path="/recipts" element={<Receipts />} />
      </Routes>
    </div>
  )
}

export default Jr
