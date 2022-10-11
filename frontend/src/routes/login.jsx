import { useForm } from '@mantine/form'
import { TextInput, PasswordInput, Paper, Group, Button, Anchor, Container, Stack, Checkbox } from '@mantine/core'
import { Link, useNavigate } from 'react-router-dom'
import DivImageBackground from '../components/div-background'
import { useEffect, useState } from 'react'
import React from 'react'
import { useLoginMutation } from '../features/auth/authApiSlice'
import { useDispatch, useSelector } from 'react-redux'
import { selectCurrentToken, setCredentials } from '../features/auth/authSlice'

const Login = () => {
  const [checked, setChecked] = useState(false)
  const navigate = useNavigate()
  const dispatch = useDispatch()

  const [login, { isLoading }] = useLoginMutation()

  const token = useSelector(selectCurrentToken)

  const form = useForm({
    initialValues: {
      username: '',
      password: ''
    }
  })

  const handleLoginSubmit = async () => {
    console.log('form.values', form.values)
    try {
      const { token } = await login({ username: form.values.username, password: form.values.password }).unwrap()
      console.log('token', token)
      if (checked) localStorage.setItem('token', token)
      dispatch(setCredentials({ accessToken: token }))
      navigate('/dashboard')
    } catch (err) {
      console.log(err)
    }
  }

  useEffect(() => {
    console.log('Token in auth', token)
    if (token) {
      navigate('/dashboard', { replace: true })
    }
  }, [])

  // useEffect(() => {
  //   console.log(checked)

  //   console.log('token from store', tk)
  // }, [checked])

  return (
    <DivImageBackground>
      <Container>
        <Paper radius="md" p="xl" withBorder>
          <form onSubmit={form.onSubmit(handleLoginSubmit)}>
            <Stack>
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
            </Stack>

            <Checkbox label="Remember my login" checked={checked} onChange={(event) => setChecked(event.currentTarget.checked)} />

            <Group position="apart" mt="xl">
              <Anchor component={Link} to={'/register'} size="xs">
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
