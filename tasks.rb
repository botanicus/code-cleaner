#!/usr/bin/env nake

begin
  require File.expand_path("../.bundle/environment", __FILE__)
rescue LoadError
  require "bundler"
  Bundler.setup
end

$LOAD_PATH.unshift(File.expand_path("../lib", __FILE__))

begin
  load "./tasks/code-cleaner.nake"
rescue LoadError
  abort "If you want to contribute to code-cleaner, you have to run ./tasks.rb hooks:whitespace:install first!"
end

Nake::Task["hooks:whitespace:install"].tap do |task|
  task.config[:path] = "bin"
  task.config[:encoding] = "utf-8"
  task.config[:whitelist] = '(bin/[^/]+|.+\.(rb|rake|nake|thor|task|gemspec))$'
end
