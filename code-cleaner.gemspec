#!/usr/bin/env gem build
# encoding: utf-8

Gem::Specification.new do |s|
  s.name = "code-cleaner"
  s.version = "0.1"
  s.authors = ["Jakub Šťastný aka Botanicus"]
  s.homepage = "http://github.com/botanicus/code-cleaner"
  s.summary = "Remove trailing whitespace, append missing \\n and replace tabs by two spaces"
  s.description = "" # TODO: long description
  s.cert_chain = nil
  s.email = ["knava.bestvinensis", "gmail.com"].join("@")
  s.has_rdoc = false

  # so you can use load "code-cleaner.rake" in you Rakefile
  s.require_paths = ["tasks"]

  # files
  s.files = Dir["**/*"]
  s.executables = ["code-cleaner"]
  s.default_executable = "code-cleaner"

  # RubyForge
  s.rubyforge_project = "code-cleaner"
end
