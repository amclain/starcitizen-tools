version = File.read(File.expand_path('../version', __FILE__)).strip

Gem::Specification.new do |s|
  s.name      = 'starcitizen-tools'
  s.version   = version
  s.date      = Time.now.strftime '%Y-%m-%d'
  s.summary   = 'A Ruby API and command-line tools for the game Star Citizen.'
  s.description = "A Ruby API and command-line tools for the game Star Citizen."
  s.homepage  = 'https://github.com/amclain/starcitizen-tools'
  s.authors   = ['Alex McLain']
  s.email     = ['alex@alexmclain.com']
  s.license   = 'MIT'
  
  s.files     =
    ['license.txt', 'README.md'] +
    Dir[
      'bin/**/*',
      'lib/**/*',
      'doc/**/*',
    ]
  
  s.executables = [
    'sct'
  ]
  
  s.add_dependency 'rake',    '~> 10.4'
  s.add_dependency 'rubyzip', '~> 1.1'
  
  s.add_development_dependency 'yard',      '~> 0.8.7'
  s.add_development_dependency 'rspec',     '~> 3.1'
  s.add_development_dependency 'rspec-its', '~> 1.1'
  s.add_development_dependency 'fivemat',   '~> 1.3'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rb-readline'
end
