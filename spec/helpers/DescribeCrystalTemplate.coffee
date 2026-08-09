global.DescribeCrystalTemplate = (template_name, addendum) ->
  describe template_name, ->
    beforeAll ->
      @project_name = "#{template_name}_project"
      @project_path = "#{ENV.tmp}/#{@project_name}"

      @template_path = "#{process.cwd()}/src/#{template_name}"
      response = await RunCLI "new #{@project_name} #{@template_path}"
      expect(response.error).toBe null

      response = await BundleInstallIn "#{ENV.tmp}/#{@project_name}"
      expect(response.error).toBe null

      response = await RakeIn "#{ENV.tmp}/#{@project_name}"
      expect(response.error).toBe null
      
    describe 'project', ->
      it 'has .git/ directory', ->
        git_directory = "#{@project_path}/.git"
        expect(git_directory).toExistAsDirectory()

    if typeof addendum is 'function'
      addendum()
