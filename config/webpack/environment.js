const { environment } = require('@rails/webpacker')
const pug = require('./loaders/pug')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
		Popper: ['popper.js', 'default']
  })
)

environment.loaders.prepend('pug', pug)

module.exports = environment
