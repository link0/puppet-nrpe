require 'puppet-lint/tasks/puppet-lint'
require 'rake'
require 'rspec/core/rake_task'

PuppetLint.configuration.send('disable_autoloader_layout')
PuppetLint.configuration.pattern = 'spec/fixtures/**/*.pp'
PuppetLint.configuration.ignore_paths = ["vendor/**/*.pp"]

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

task :default => [:spec, :lint]

