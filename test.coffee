#!/usr/bin/env coffee
name = process.argv[2]
global.TEMPLATE = { name }
require './scripts/run_specs.coffee'
