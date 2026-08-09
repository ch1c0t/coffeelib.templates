global.RakeIn = (dir) ->
  await sh "bundle exec rake",
    cwd: dir
