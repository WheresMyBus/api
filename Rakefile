# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rake/testtask'
require_relative 'config/application'

Rails.application.load_tasks

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/integration/*_test.rb']
  t.verbose = true
end

task :default => :test