import { createEntityAdapter, createSelector } from '@reduxjs/toolkit'

import { apiSlice } from '../../app/api/apiSlice'

const shopsAdapter = createEntityAdapter({})
const initialState = shopsAdapter.getInitialState()

export const receiptsApiSlice = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getReceipts: builder.query({
      query: () => ({
        url: '/api/receipts/',
        validateStatus: (response, result) => {
          return response.status === 200 && !result.isError
        }
      })
    }),
    addReceipt: builder.mutation({
      query: (receipt) => ({
        url: '/api/receipts/',
        method: 'POST',
        body: { ...receipt },
        validateStatus: (response, result) => {
          return response.status === 201 && !result.isError
        }
      })
    })
  })
})

export const { useGetReceiptsQuery, useAddReceiptMutation } = receiptsApiSlice
