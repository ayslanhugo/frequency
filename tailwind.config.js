const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  darkMode: 'class',
    theme: {
      extend: {
    },
  },
  plugins: [],
}