{ read, exists } = IO.sync
Jasmine = require 'jasmine'

config =
  spec_dir: 'spec'
  spec_files: [
    '**/*.spec.coffee'
  ]
  helpers: [
    'helpers/**/*.coffee'
  ]
  stopSpecOnExpectationFailure: no
  jsLoader: 'require'
  random: yes

if TEMPLATE?
  config.spec_files = [
    "**/#{TEMPLATE.name}.spec.coffee"
  ]

exports.CreateJasmine = ->
  jasmine = new Jasmine()

  jasmine.loadConfig config
  jasmine.configureDefaultReporter
    showColors: true

  jasmine.exitOnCompletion = false
  jasmine
