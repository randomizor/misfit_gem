$:.push File.expand_path('../lib', __FILE__)
$:.push File.join(File.dirname(__FILE__), '.', 'lib')

require 'misfit_gem/version'

Gem::Specification.new do |s|
  s.name        = 'misfit_gem'
  s.version     = MisfitGem::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Jay Whiting']
  s.email       = ['misfit_gem@thedevsquad.com']
  s.homepage    = 'http://github.com/randomizor/misfit_gem.git'
  s.summary     = %q{OAuth client library to the data on misfit.com}
  s.description = %q{A client library to retrieve data from misfit shine}

  s.add_dependency 'oauth'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec',     '~> 3.0.0'
  
  s.rubyforge_project = 'misfit_gem'
  
  s.files = [
    '.gitignore',
    'Gemfile',
    'Guardfile',
    'LICENSE',
    'README.md',
    'Rakefile',
    'changelog.md',
    'misfit_gem.gemspec',
    'lib/misfit_gem.rb',
    'lib/misfit_gem/client.rb',
    'lib/misfit_gem/device.rb',
    'lib/misfit_gem/errors.rb',
    'lib/misfit_gem/goals.rb',
    'lib/misfit_gem/helpers.rb',
    'lib/misfit_gem/profile.rb',
    'lib/misfit_gem/sessions.rb',
    'lib/misfit_gem/sleeps.rb',
    'lib/misfit_gem/summary.rb',
    'lib/misfit_gem/version.rb'
  ]
  s.test_files   = [
    'spec/misfit_gem_spec.rb',
    'spec/spec_helper.rb',
    'spec/misfit_gem_client_spec.rb',
    'spec/misfit_gem_information_spec.rb',
    'spec/misfit_gem_resources_spec.rb'
  ]
  s.require_paths = ['lib']
end