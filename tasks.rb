#!/usr/bin/env nake

begin
  load "./tasks/code-cleaner.nake"
rescue LoadError
  abort "If you want to contribute to code-cleaner, you have to run ./tasks.rb hooks:whitespace:install first!"
end
