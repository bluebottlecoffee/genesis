# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'

Dir.glob('lib/tasks/*.rake').each { |t| import t }

task default: :test
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.warning = false
end
