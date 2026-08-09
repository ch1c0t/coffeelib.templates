DescribeCrystalTemplate 'crystal-cli', ->
  it 'builds a project that can build a CLI binary', ->
    response = await sh 'bundle exec rake',
      cwd: @project_path
    expect(response.error).toBe null

    cli = "#{@project_path}/bin/#{@project_name}"
    response = await sh cli
    expect(response.stdout).toStartWith "#{@project_name} is"
