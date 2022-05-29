import { useForm } from '@mantine/hooks'
import {
	TextInput,
	PasswordInput,
	Paper,
	Group,
	Button,
	Anchor,
	Container,
} from '@mantine/core'
import { Link } from 'react-router-dom'
import DivImageBackground from '../components/div-background'

export function Login(props) {
	const form = useForm({
		initialValues: {
			email: '',
			name: '',
			password: '',
			terms: true,
		},

		validationRules: {
			email: (val) => /^\S+@\S+$/.test(val),
			password: (val) => val.length >= 6,
		},
	})

	return (
		<DivImageBackground>
			<Container>
				<Paper radius="md" p="xl" withBorder {...props}>
					<form onSubmit={form.onSubmit(() => {})}>
						<Group direction="column" grow>
							<TextInput
								required
								label="Email"
								placeholder="hello@mantine.dev"
								value={form.values.email}
								onChange={(event) =>
									form.setFieldValue('email', event.currentTarget.value)
								}
								error={form.errors.email && 'Invalid email'}
							/>

							<PasswordInput
								required
								label="Password"
								placeholder="Your password"
								value={form.values.password}
								onChange={(event) =>
									form.setFieldValue('password', event.currentTarget.value)
								}
								error={
									form.errors.password &&
									'Password should include at least 6 characters'
								}
							/>
						</Group>

						<Group position="apart" mt="xl">
							<Anchor component={Link} to={'/register '} size="xs">
								{' '}
								Don't have an account? Register{' '}
							</Anchor>
							<Button type="submit">Login</Button>
						</Group>
					</form>
				</Paper>
			</Container>
		</DivImageBackground>
	)
}
