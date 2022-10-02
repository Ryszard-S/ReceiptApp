import { createSelector, createEntityAdapter } from '@reduxjs/toolkit'
import { apiSlice } from '../../app/api/apiSlice'

const shopsAdapter = createEntityAdapter({})
const initialState = shopsAdapter.getInitialState()

export const shopsApiSlice = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getShops: builder.query({
      query: () => ({
        url: '/api/',
        validateStatus: (response, result) => {
          return response.status === 200 && !result.isError
        }
      })

      //   providesTags: (result, error, arg) => {
      //     if (result?.ids) {
      //       return [{ type: 'Note', id: 'LIST' }, ...result.ids.map((id) => ({ type: 'Note', id }))]
      //     } else return [{ type: 'Note', id: 'LIST' }]
      //   }
    })
    // addNewNote: builder.mutation({
    //   query: (initialNote) => ({
    //     url: '/notes',
    //     method: 'POST',
    //     body: {
    //       ...initialNote
    //     }
    //   }),
    //   invalidatesTags: [{ type: 'Note', id: 'LIST' }]
    // }),
    // updateNote: builder.mutation({
    //   query: (initialNote) => ({
    //     url: '/notes',
    //     method: 'PATCH',
    //     body: {
    //       ...initialNote
    //     }
    //   }),
    //   invalidatesTags: (result, error, arg) => [{ type: 'Note', id: arg.id }]
    // }),
    // deleteNote: builder.mutation({
    //   query: ({ id }) => ({
    //     url: `/notes`,
    //     method: 'DELETE',
    //     body: { id }
    //   }),
    //   invalidatesTags: (result, error, arg) => [{ type: 'Note', id: arg.id }]
    // })
  })
})

export const { useGetShopsQuery } = shopsApiSlice

// returns the query result object
export const selectShopsResult = shopsApiSlice.endpoints.getShops.select()

// creates memoized selector
const selectShopsData = createSelector(
  selectShopsResult,
  (shopsResult) => shopsResult.data // normalized state object with ids & entities
)

//getSelectors creates these selectors and we rename them with aliases using destructuring
export const {
  selectAll: selectAllShops,
  selectById: selectShopById,
  selectIds: selectShopIds
  // Pass in a selector that returns the notes slice of state
} = shopsAdapter.getSelectors((state) => selectShopsData(state) ?? initialState)
