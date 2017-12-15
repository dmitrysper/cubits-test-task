# describing Dromedary rake tasks
desc 'Rake task to run Cucumber/Selenium tests'
task :start_test_run, [:browser, :tag] do |task, args|
  args.with_defaults(browser: 'chrome', tag: '')
  command = 'bundle exec cucumber'
  command += " -p cubits.tests.#{args.browser}"
  command += " -t #{args.tag}" unless args.tag.empty?
  puts "Starting Cucumber/Selenium tests with the following command - << #{command} >>"
  system command
end