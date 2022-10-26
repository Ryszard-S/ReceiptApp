import { createEntityAdapter, createSelector } from '@reduxjs/toolkit'

import { apiSlice } from '../../app/api/apiSlice'

const receiptsAdapter = createEntityAdapter({})
const initialState = receiptsAdapter.getInitialState()

export const receiptsApiSlice = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getReceipts: builder.query({
      query: () => ({
        url: '/api/receipts/',
        validateStatus: (response, result) => {
          return response.status === 200 && !result.isError
        }
      }),
      transformResponse: (responseData) => {
        return receiptsAdapter.setAll(initialState, responseData)
      },
      providesTags: (result, error, arg) => {
        if (result?.ids) {
          return [{ type: 'Receipt', id: 'LIST' }, ...result.ids.map((id) => ({ type: 'Receipt', id }))]
        } else return [{ type: 'Receipt', id: 'LIST' }]
      }
    }),
    addReceipt: builder.mutation({
      query: (receipt) => ({
        url: '/api/receipts/',
        method: 'POST',
        body: { ...receipt },
        validateStatus: (response, result) => {
          return response.status === 201 && !result.isError
        }
      }),
      invalidatesTags: ['Receipt']
    })
  })
})

export const { useGetReceiptsQuery, useAddReceiptMutation } = receiptsApiSlice
export const selectReceiptsResult = receiptsApiSlice.endpoints.getReceipts.select("receipts")
const selectReceiptsData = createSelector(selectReceiptsResult, (receiptsResult) => receiptsResult.data)

export const { selectAll: selectAllReceipts, selectById: selectReceiptById, selectIds: selectReceiptIds } = receiptsAdapter.getSelectors((state) => selectReceiptsData(state) ?? initialState)
