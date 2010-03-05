#!/usr/bin/env gem build
# encoding: utf-8

require "base64"

Gem::Specification.new do |s|
  s.name = "code-cleaner"
  s.version = "0.8.2"
  s.authors = ["Jakub Šťastný aka Botanicus"]
  s.homepage = "http://github.com/botanicus/code-cleaner"
  s.summary = "Remove trailing whitespace, append missing \\n and replace tabs by two spaces"
  s.description = "" # TODO: long description
  s.cert_chain = nil
  s.email = Base64.decode64("c3Rhc3RueUAxMDFpZGVhcy5jeg==\n")
  s.has_rdoc = false

  # so you can use load "code-cleaner.rake" in you Rakefile
  s.require_paths = ["tasks"]

  # files
  s.files = `git ls-files`.split("\n")

  s.executables = Dir["bin/*"].map(&File.method(:basename))
  s.default_executable = "code-cleaner"

  # RubyForge
  s.rubyforge_project = "code-cleaner"
end
