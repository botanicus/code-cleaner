# encoding: utf-8

require "fileutils"

module Hooks
  class Whitespace < Thor
    desc "install", "Install hook for automatically removing trailing whitespace"
    def install
      if File.exist?(".git/hooks/pre-commit")
        abort "You must remove .git/hooks/pre-commit first!"
      else
        puts "Installing .git/hooks/pre-commit ..."
        source = File.join(File.dirname(__FILE__), "..", "support", "pre-commit")
        FileUtils.install source, ".git/hooks/pre-commit", :mode => 0755
      end
    rescue Errno::ENOENT
      abort "You have to run git init first!"
    end
  end
end
