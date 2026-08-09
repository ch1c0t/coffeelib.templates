global.DescribeTemplate = (template_name, addendum) ->
  describe template_name, ->
    beforeAll ->
      @project_name = "#{template_name}_project"
      @project_path = "#{ENV.tmp}/#{@project_name}"

      @template_path = "#{process.cwd()}/src/#{template_name}"
      @response = await RunCLI "new #{@project_name} #{@template_path}"

    it 'creates a new template project', ->
      expect(@response.error).toBe null

    describe 'project', ->
      it 'has .git/ directory', ->
        git_directory = "#{@project_path}/.git"
        expect(git_directory).toExistAsDirectory()

      it 'project specs pass', ->
        response = await RunSpecsIn "#{ENV.tmp}/#{@project_name}"
        expect(response.error)
          .withContext response.stdout
          .toBe null

    if typeof addendum is 'function'
      addendum()
