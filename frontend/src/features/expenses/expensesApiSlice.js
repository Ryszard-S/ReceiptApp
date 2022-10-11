import { createSelector, createEntityAdapter } from '@reduxjs/toolkit'
import { apiSlice } from '../../app/api/apiSlice'


const shopsAdapter = createEntityAdapter({})
const initialState = shopsAdapter.getInitialState()

export const shopsApiSlice = apiSlice.injectEndpoints({
    endpoints: (builder) => ({
        getExpenses: builder.query({
            query: () => ({
                