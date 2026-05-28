{ basename } = require 'path'
template_name = (basename __filename).split('.')[0]
DescribeTemplate template_name
