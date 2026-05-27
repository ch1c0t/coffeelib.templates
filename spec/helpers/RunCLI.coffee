global.RunCLI = (string) ->
  await sh "coffeelib #{string}",
    cwd: ENV.tmp
