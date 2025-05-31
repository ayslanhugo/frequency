const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        // 'lato': ['Lato', ...defaultTheme.fontFamily.sans], // Pode manter se quiser
        'pacifico': ['Pacifico', ...defaultTheme.fontFamily.cursive], // Nova fonte "Pacifico"
      },
    },
  },
  plugins: [],
}