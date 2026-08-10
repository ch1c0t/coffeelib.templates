{ mkdir, write } = IO.sync

->
  cli_dir = "#{@dir}/src.source/bin/#{@name}"
  mkdir cli_dir

  help_message = """
  #{@name} is a CLI made with Crystal.
  """
  write "#{cli_dir}/help", help_message
