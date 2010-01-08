#!/usr/bin/env nake

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
