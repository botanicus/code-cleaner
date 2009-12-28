# encoding: utf-8

# The task for Rake doesn't support any options. Sorry, your task utility sucks, get something better.
# The reason why I can't add --path option is that Rake has very nasty bug http://gist.github.com/263325
# Yeah, I know I can use environment varibles, but why I should bother when you can just install nake which is so much better!
desc "Install hook for automatically removing trailing whitespace"
task "hooks:whitespace:install" do
  if File.exist?(".git/hooks/pre-commit")
    abort "You must remove .git/hooks/pre-commit first!"
  else
    begin
      puts "Installing .git/hooks/pre-commit ..."
      source = File.join(File.dirname(__FILE__), "..", "support", "pre-commit.erb")
      File.open(".git/hooks/pre-commit", "w") do |file|
        file.puts(ERB.new(File.read(source)).result)
      end
      File.chmod(0755, ".git/hooks/pre-commit")
    rescue Errno::ENOENT
      abort "You have to run git init first!"
    end
  end
end
