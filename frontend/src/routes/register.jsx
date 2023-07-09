import { Anchor, Button, Checkbox, Container, Group, Paper, PasswordInput, Stack, TextInput } from '@mantine/core'
import { useForm } from '@mantine/form'
import React from 'react'
import { Link } from 'react-router-dom'

import DivImageBackground from '../components/div-background'
import useTitle from '../hooks/useTitle'

export function Register(props) {
  useTitle('Register')
  const form = useForm({
    initialValues: {
      email: '',
      name: '',
      password: '',
      terms: false
    },

    validate: {
      email: (val) => /^\S+@\S+$/.test(val),
      name: (value) => (value.length < 2 ? 'Name must have at least 2 letters' : null),
      password: (val) => val.length >= 6
    }
  })

  return (
    <DivImageBackground>
      <Container>
        <Paper radius="md" p="xl" withBorder {...props}>
          <form onSubmit={form.onSubmit((values) => console.log(values))}>
            <Stack>
              <TextInput label="Name" placeholder="Your name" value={form.values.name} {...form.getInputProps('name')} />

              <TextInput
                required
                label="Email"
                placeholder="hello@mantine.dev"
                value={form.values.email}
                onChange={(event) => form.setFieldValue('email', event.currentTarget.value)}
                error={form.errors.email && 'Invalid email'}
              />

              <PasswordInput
                required
                label="Password"
                placeholder="Your password"
                value={form.values.password}
                onChange={(event) => form.setFieldValue('password', event.currentTarget.value)}
                error={form.errors.password && 'Password should include at least 6 characters'}
              />

              <Checkbox label="I accept terms and conditions" checked={form.values.terms} onChange={(event) => form.setFieldValue('terms', event.currentTarget.checked)} />
            </Stack>

            <Group position="apart" mt="xl">
              <Anchor component={Link} to={'/login'} size="xs">
                Already have an account? Login
              </Anchor>

              <Button type="submit">Register</Button>
            </Group>
          </form>
        </Paper>
      </Container>
    </DivImageBackground>
  )
}
