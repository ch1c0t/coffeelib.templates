global.ItCreatesGitRepository = ->
  it 'has .git/ directory', ->
    git_directory = "#{@instance_path}/.git"
    expect(git_directory).toExistAsDirectory()
