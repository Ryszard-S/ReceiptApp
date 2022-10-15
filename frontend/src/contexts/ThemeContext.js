import React from 'react'
import { MantineProvider } from '@mantine/styles'

export const ThemeProvider = ({ children }) => (
  <MantineProvider
    withNormalizeCSS
    withGlobalStyles
    theme={{
      fontFamily: 'Lato',
      other:{
        headerHeight: 70
      }
    }}
  >
    {children}
  </MantineProvider>
)
