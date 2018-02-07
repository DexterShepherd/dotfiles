# vim: set syntax=ruby:
#
Pry.config.pager = false

Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

def qa
  require_relative '../kadenze/qa_automation/spec/spec_helper'
end

def manual
  SpecUtils.debug = true
  @driver = SpecUtils.start 'manual' 
  SpecUtils.new_user
end
