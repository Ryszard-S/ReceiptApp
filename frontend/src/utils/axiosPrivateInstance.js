import axios from 'axios'

const baseURL = 'http://127.0.0.1:8000/api'
let authTokens = localStorage.getItem('authTokens') ? JSON.parse(localStorage.getItem('authTokens')) : null
console.log('authTokens axios', authTokens)

const axiosPrivateInstance = axios.create({
  baseURL,
  headers: { Authorization: `Bearer ${authTokens?.token}` }
})

export default axiosPrivateInstance
