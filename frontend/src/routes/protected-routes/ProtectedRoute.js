import { type ReactElement, useEffect, useContext } from 'react'
import { useNavigate } from 'react-router-dom'
import { AppContext } from '../../contexts/AppStateContext'


const ProtectedRoute = ({ children }) => {
  const navigate = useNavigate()
  const [{ token }] = useContext(AppContext)

  useEffect(() => {
    if (!token) {
      navigate('../login', { replace: true })
    }
  }, [token, navigate])

  return children
}

export default ProtectedRoute