import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Navbar from './components/navbar'
import { Login } from './routes/login'
import { Register } from './routes/register'

function App() {
	return (
		<BrowserRouter>
			<Routes>
				<Route path="/" element={<Navbar />}>
					<Route path="/login" element={<Login />} />
					<Route path="/register" element={<Register />} />
				</Route>
			</Routes>
		</BrowserRouter>
	)
}

export default App
