{ CreateJasmine } = require './CreateJasmine.coffee'
{ CreateTmpDirectory } = require './CreateTmpDirectory.coffee'

exports.CreateEnvironment = ->
  await Promise.resolve()

  jasmine = CreateJasmine()
  tmp = CreateTmpDirectory()

  { jasmine, tmp }
