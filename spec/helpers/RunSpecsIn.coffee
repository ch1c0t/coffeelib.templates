global.RunSpecsIn = (path) ->
  await sh "npm test",
    cwd: path
