# encoding: utf-8

require "fileutils"

# thor hooks:whitespace:install
# thor hooks:whitespace:install --force
# thor hooks:whitespace:install --path=script
module Hooks
  class Whitespace < Thor
    method_options :force => :boolean, :path => :string
    desc "install", "Install hook for automatically removing trailing whitespace"
    def install
      # --force
      if File.exist?(".git/hooks/pre-commit") && options[:force]
        FileUtils.rm ".git/hooks/pre-commit"
      end

      if File.exist?(".git/hooks/pre-commit")
        abort "You must remove .git/hooks/pre-commit first!"
      else
        puts "Installing .git/hooks/pre-commit ..."
        source = File.join(File.dirname(__FILE__), "..", "support", "pre-commit.erb")
        File.open(".git/hooks/pre-commit", "w") do |file|
          file.puts(ERB.new(File.read(source)).result(binding))
        end
        File.chmod(0755, ".git/hooks/pre-commit")
      end
    rescue Errno::ENOENT
      abort "You have to run git init first!"
    end
  end
end
