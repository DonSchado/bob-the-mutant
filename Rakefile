require "active_support/core_ext"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :spec do
  enabled = begin
    require 'mutant'
  rescue LoadError
    false
  end

  if enabled
    desc 'Mutate all the things'
    task mutant: :default do
      required_files = []
      required_classes = []

      source_files = Rake::FileList.new('lib/**/*.rb') { |fl| fl.exclude('~*') }
      source_files.each do |file|
        required_files << "-r #{File.basename(file)}"
        required_classes << File.basename(file, '.rb').classify
      end

      system("CLI_OPTIONS=no-coverage mutant -I lib #{required_files.join(" ")} --rspec #{required_classes.join(" ")}")
    end
  else
    desc 'Mutate all the things'
    task mutant: :default do
      $stderr.puts 'Mutant is disabled'
    end
  end
end
