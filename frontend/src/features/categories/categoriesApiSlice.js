import { createSelector, createEntityAdapter } from '@reduxjs/toolkit'
import { apiSlice } from '../../app/api/apiSlice'

const categoriesAdapter = createEntityAdapter({})
const initialState = categoriesAdapter.getInitialState()

export const categoriesApiSlice = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getCategories: builder.query({
      query: () => ({
        url: '/api/receipts/category/',
        validateStatus: (response, result) => {
          return response.status === 200 && !result.isError
        }
      }),
      providesTags: ['Category']
    }),
    addNewCategory: builder.mutation({
      query: (initialCategorie) => ({
        url: '/api/receipts/category/',
        method: 'POST',
        body: {
          ...initialCategorie
        }
      }),
      invalidatesTags: ['Category']
    })
  })
})

export const { useGetCategoriesQuery, useAddNewCategoryMutation } = categoriesApiSlice

export const selectCategoriesResult = categoriesApiSlice.endpoints.getCategories.select()

const selectCategoriesData = createSelector(selectCategoriesResult, (categoriesResult) => categoriesResult.data)

export const { selectAll: selectAllCategories, selectById: selectCategoryById, selectIds: selectCategoryIds } = categoriesAdapter.getSelectors((state) => selectCategoriesData(state) ?? initialState)
