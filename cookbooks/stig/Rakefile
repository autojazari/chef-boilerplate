require 'bundler/setup'

task default: [:list]

desc 'Lists all the tasks.'
task :list do
  puts "Tasks: \n- #{Rake::Task.tasks.join("\n- ")}"
end

desc 'Clean some generated files'
task :clean do
  %w(
    Berksfile.lock
    .bundle
    .cache
    coverage
    Gemfile.lock
    .kitchen
    metadata.json
    vendor
  ).each { |f| FileUtils.rm_rf(Dir.glob(f)) }
end

desc 'Run ChefSpec/Rspec unit tests'
task :unit do
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.rspec_opts = '--color --format progress'
    t.pattern = 'spec/*_spec.rb'
  end
end

namespace :style do
  require 'rubocop/rake_task'
  desc 'Run Ruby style checks using rubocop'
  RuboCop::RakeTask.new(:ruby)

  require 'foodcritic'
  desc 'Run Chef style checks using foodcritic'
  FoodCritic::Rake::LintTask.new(:chef)
end

desc 'Run all style checks'
task style: %w(style:chef style:ruby)
