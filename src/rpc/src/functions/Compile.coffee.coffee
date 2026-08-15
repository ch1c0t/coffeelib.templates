"""
{ compile } = require 'coffeescript'

module.exports = f
  in:
    code: String
    bare: Boolean
  out: ->
    compile @code, @props
"""
