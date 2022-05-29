import { useForm } from '@mantine/hooks'
import {
	TextInput,
	PasswordInput,
	Paper,
	Group,
	Button,
	Checkbox,
	Anchor,
	Container,
} from '@mantine/core'
import { Link } from 'react-router-dom'

export function Register(props) {
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
		<Container>
			<Paper radius="md" p="xl" withBorder {...props}>
				<form onSubmit={form.onSubmit(() => {})}>
					<Group direction="column" grow>
						<TextInput
							label="Name"
							placeholder="Your name"
							value={form.values.name}
							onChange={(event) =>
								form.setFieldValue('name', event.currentTarget.value)
							}
						/>

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

						<Checkbox
							label="I accept terms and conditions"
							checked={form.values.terms}
							onChange={(event) =>
								form.setFieldValue('terms', event.currentTarget.checked)
							}
						/>
					</Group>

					<Group position="apart" mt="xl">
						<Anchor component={Link} to={'/login'} size="xs">
							Already have an account? Login
						</Anchor>

						<Button type="submit">Register</Button>
					</Group>
				</form>
			</Paper>
		</Container>
	)
}
