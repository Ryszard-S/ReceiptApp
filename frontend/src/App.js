import { Fragment } from 'react'
import { Routes, Route } from 'react-router-dom'
import { Home } from 'tabler-icons-react'
import Navbar from './components/navbar'
import Jr from './routes/jr'
import { Login } from './routes/login'
import PrivateRoute from './routes/private-route/PrivateRoute'
import { Register } from './routes/register'

function App() {
	return (
		<Fragment>
			<Navbar />
			<Routes>
				<Route path="/" element={<Home />} />
				<Route path="/login" element={<Login />} />
				<Route path="/register" element={<Register />} />
				<Route element={<PrivateRoute />}>
					<Route path={'/jr'} element={<Jr />} />
				</Route>
			</Routes>
		</Fragment>
	)
}

export default App
