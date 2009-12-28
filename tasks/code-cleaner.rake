# encoding: utf-8

desc "Install hook for automatically removing trailing whitespace"
task "hooks:whitespace:install" do
  if File.exist?(".git/hooks/pre-commit")
    abort "You must remove .git/hooks/pre-commit first!"
  else
    begin
      puts "Installing .git/hooks/pre-commit ..."
      source = File.join(File.dirname(__FILE__), "..", "support", "pre-commit")
      install source, ".git/hooks/pre-commit", :mode => 0755
    rescue Errno::ENOENT
      abort "You have to run git init first!"
    end
  end
end
