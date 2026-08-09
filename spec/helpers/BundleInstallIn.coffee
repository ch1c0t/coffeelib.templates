global.BundleInstallIn = (dir) ->
  await sh "bundle install",
    cwd: dir
