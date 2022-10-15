import { NotificationsProvider } from '@mantine/notifications'
import React from 'react'
import ReactDOM from 'react-dom/client'
import { Provider } from 'react-redux'
import { BrowserRouter, Route, Routes } from 'react-router-dom'

import App from './App'
import { store } from './app/store'
import { ThemeProvider } from './contexts/ThemeContext'

// @ts-ignore
const root = ReactDOM.createRoot(document.getElementById('root'))
root.render(
  <React.StrictMode>
    <ThemeProvider>
      <NotificationsProvider>
        <Provider store={store}>
          <BrowserRouter>
            {/* <App /> */}
            <Routes>
              <Route path="/*" element={<App />} />
            </Routes>
          </BrowserRouter>
        </Provider>
      </NotificationsProvider>
    </ThemeProvider>
  </React.StrictMode>
)

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
