disabled_checks = %w( 80chars
                      documentation
                      single_quote_string_with_variables
                      autoloader_layout
                      ensure_first_param
                      puppet_url_without_modules
                      case_without_default
                      nested_classes_or_defines )

task :default => :help

desc 'Help'
task :help do
  sh 'rake -T'
end


namespace :gem do
  desc 'Build gem'
  task :build do
    sh 'gem build -V galera-ha.gemspec'
  end

  desc 'Install local gem'
  task :install do
    sh 'gem install galera-ha-*.gem'
  end

  desc 'Clean build gems'
  task :clean do
    sh 'rm -f *.gem'
  end

  desc 'Push new gem'
  task :push do
    sh 'gem push galera-ha-*.gem'
  end

  desc 'Clean, build & install'
  task all: [:clean, :build, :install]
end
