import { MantineProvider } from '@mantine/styles'

export const ThemeProvider = ({ children }) => (
	<MantineProvider
		withNormalizeCSS
		withGlobalStyles
		theme={{
			fontFamily: 'Lato',
		}}
	>
		{children}
	</MantineProvider>
)
