require "active_support/core_ext"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

def required_file(file)
  File.basename(file)
end

def required_class(file)
  File.basename(file, '.rb').classify
end

def mutant(file)
  required_class(file).parameterize.to_sym
end

task :default => :spec

namespace :mutant do
  SOURCE_FILES = Rake::FileList.new('lib/**/*.rb') { |fl| fl.exclude('~*') }

  enabled = begin
    require 'mutant'
  rescue LoadError
    false
  end

  if enabled
    desc 'Mutate all the things'
    task all: :default do
      files = []
      classes = []

      SOURCE_FILES.each do |file|
        files << "-r #{required_file(file)}"
        classes << required_class(file)
      end

      system("CLI_OPTIONS=no-coverage mutant -I lib #{files.join(" ")} --rspec #{classes.join(" ")}")
    end

    SOURCE_FILES.each do |file|
      desc "Mutate #{required_class(file)}"
      task mutant(file) => :default do
        system("CLI_OPTIONS=no-coverage mutant -I lib -r #{required_file(file)} --rspec #{required_class(file)}")
      end
    end

  else
    desc 'Mutate all the things'
    task all: :default do
      $stderr.puts 'Mutant is disabled'
    end
  end

end
