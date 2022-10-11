import { createSelector, createEntityAdapter } from '@reduxjs/toolkit'
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
        })
    })
})

export const { useGetReceiptsQuery } = receiptsApiSlice

