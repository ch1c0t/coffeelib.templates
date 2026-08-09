global.RunIn = (dir, commands) ->
  for command in commands
    response = await sh command, cwd: dir

    if response.error
      p response
      throw new Error response.error
