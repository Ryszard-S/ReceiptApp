import { useForm } from '@mantine/form'
import { TextInput, PasswordInput, Paper, Group, Button, Anchor, Container } from '@mantine/core'
import { Link, useNavigate } from 'react-router-dom'
import DivImageBackground from '../components/div-background'
import { useContext, useEffect } from 'react'
import AuthContext from '../contexts/AuthContext'

const Login = (props) => {
  let { loginUser, authTokens } = useContext(AuthContext)
  const navigate = useNavigate()
  const form = useForm({
    initialValues: {
      username: '',
      password: ''
    },

    validationRules: {
      username: (val) => val.length >= 6,
      password: (val) => val.length >= 6
    }
  })

  useEffect(() => {
    if (authTokens) {
      navigate('/jr', { replace: true })
    }
  })

  return (
    <DivImageBackground>
      <Container>
        <Paper radius="md" p="xl" withBorder {...props}>
          <form onSubmit={form.onSubmit(loginUser)}>
            <Group direction="column" grow>
              <TextInput
                required
                name="username"
                label="Username"
                value={form.values.username}
                onChange={(event) => form.setFieldValue('username', event.currentTarget.value)}
                error={form.errors.username && 'Invalid username'}
              />

              <PasswordInput
                required
                name="password"
                label="Password"
                placeholder="Your password"
                value={form.values.password}
                onChange={(event) => form.setFieldValue('password', event.currentTarget.value)}
                error={form.errors.password && 'Password should include at least 6 characters'}
              />
            </Group>

            <Group position="apart" mt="xl">
              <Anchor component={Link} to={'/register '} size="xs">
                Don't have an account? Register
              </Anchor>
              <Button type="submit">Login</Button>
            </Group>
          </form>
        </Paper>
      </Container>
    </DivImageBackground>
  )
}

export default Login
