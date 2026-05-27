template_name = 'default'
template_path = "#{process.cwd()}/src/#{template_name}"

describe template_name, ->
  beforeAll ->
    @instance_name = "#{template_name}_instance"
    @response = await RunCLI "new #{@instance_name} #{template_path}"
    @instance_path = "#{ENV.tmp}/#{@instance_name}"

  it 'creates a new template instance', ->
    expect(@response.error).toBe null

    response = await RunSpecsIn "#{ENV.tmp}/#{@instance_name}"
    expect(response.error)
      .withContext response.stdout
      .toBe null

  ItCreatesGitRepository()
