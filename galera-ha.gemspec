Gem::Specification.new do |s|
  s.name                  = 'galera-ha'
  s.version               = '0.1'
  s.date                  = Time.now.strftime('%Y-%m-%d')
  s.summary               = 'Galera readiness check'
  s.description           = 'Small Thin server monitoring Galera cluster members state - useful for HAProxy HTTP check'
  s.authors               = [ "Tomas 'arteal' Hejatko" ]
  s.email                 = 'tomas.hejatko@gmail.com'
  s.executables           = Dir['bin/*'].map { |f| f.split('/').last }
  s.homepage              = 'https://github.com/arteal/galera-ha'
  s.license               = 'GPL-2.0'
  s.required_ruby_version = '>= 1.9.3'
  s.add_runtime_dependency 'thin', '~> 1.7', '>= 1.7.0'
  s.add_runtime_dependency 'mysql2', '~> 0.4', '>= 0.4.5'
  s.add_runtime_dependency 'json', '~> 1.8', '>= 1.8.3'
end