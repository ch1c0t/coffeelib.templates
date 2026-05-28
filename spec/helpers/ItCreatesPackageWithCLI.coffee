global.ItCreatesPackageWithCLI = ->
  beforeAll ->
    @cli = "#{@instance_path}/bin/#{@instance_name}"

  it 'succeeds', ->
    expect(@response.error).toBe null

  it 'creates a file for CLI', ->
    expect(@cli).toExistAsFile()

  it 'prints the help message', ->
    response = await sh "#{@cli} help"
    expect(response.stdout.trim()).toBe """
    A short description of this CLI.

      version             Print the version.
      help                Show this message.
    """

  it 'prints the version', ->
    response = await sh "#{@cli} version"
    expect(response.stdout.trim()).toBe '0.0.0'

  it 'has specs that pass', ->
    response = await sh 'npm test', cwd: @instance_path
    expect(response.error)
      .withContext response.stdout
      .toBe null
