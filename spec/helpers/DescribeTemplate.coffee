global.DescribeTemplate = (template_name, addendum) ->
  describe template_name, ->
    beforeAll ->
      @instance_name = "#{template_name}_pro"
      @instance_path = "#{ENV.tmp}/#{@instance_name}"

      @template_path = "#{process.cwd()}/src/#{template_name}"
      @response = await RunCLI "new #{@instance_name} #{@template_path}"

    it 'creates a new template instance', ->
      expect(@response.error).toBe null

    describe 'instance', ->
      it 'has .git/ directory', ->
        git_directory = "#{@instance_path}/.git"
        expect(git_directory).toExistAsDirectory()

      it 'instance specs pass', ->
        response = await RunSpecsIn "#{ENV.tmp}/#{@instance_name}"
        expect(response.error)
          .withContext response.stdout
          .toBe null

    if typeof addendum is 'function'
      addendum()
