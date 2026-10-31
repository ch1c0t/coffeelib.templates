"""
{ RPC } = require 'hobby-rpc.client'

describe 'Version', ->
  beforeEach ->
    { socket } = await serve 'unix_socket'
    @rpc = RPC { socket }

  it 'returns the CoffeeScript version', ->
    string = await @rpc 'Version'
    expect(string).toStartWith '2.7'
"""
