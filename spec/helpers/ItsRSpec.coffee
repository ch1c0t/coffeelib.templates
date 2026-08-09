global.ItsRSpec = ->
  it 'creates a project with passing specs', ->
    await RunIn @project_path, [
      'bundle exec rspec'
    ]
