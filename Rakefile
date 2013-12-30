require 'reek/rake/task'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

require 'flog'
require 'flog_task'

FlogTask.new :flog, 100, %w( lib )

require 'flay'
require 'flay_task'

FlayTask.new :flay, 1, %w( lib )

Reek::Rake::Task.new do |t|
  t.fail_on_error = false
end

Rubocop::RakeTask.new

desc 'Run all tests and checkers'
task ci: %w[ spec reek rubocop flog flay]
