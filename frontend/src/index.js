import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import App from './App'
import { Provider } from 'react-redux'
import { store } from './app/store'
import { ThemeProvider } from './contexts/ThemeContext'
import { NotificationsProvider } from '@mantine/notifications'
import { AuthProvider } from './contexts/AuthContext'

// @ts-ignore
const root = ReactDOM.createRoot(document.getElementById('root'))
root.render(
  <React.StrictMode>
    <ThemeProvider>
      <NotificationsProvider>
        <Provider store={store}>
          <AuthProvider>
            <BrowserRouter>
              {/* <App /> */}
              <Routes>
                <Route path="/*" element={<App />} />
              </Routes>
            </BrowserRouter>
          </AuthProvider>
        </Provider>
      </NotificationsProvider>
    </ThemeProvider>
  </React.StrictMode>
)

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
