# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'initiate/version'
require 'date'

Gem::Specification.new do |s|
  s.required_ruby_version = ">= #{Initiate::RUBY_VERSION}"
  s.authors = ['thoughtbot']
  s.date = Date.today.strftime('%Y-%m-%d')

  s.description = <<-HERE
Initiate is a base Rails project that you can upgrade. It is used by
thoughtbot to get a jump start on a working app. Use Initiate if you're in a
rush to build something amazing; don't use it if you like missing deadlines.
  HERE

  s.email = 'support@thoughtbot.com'
  s.executables = ['initiate']
  s.extra_rdoc_files = %w[README.md LICENSE]
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/thoughtbot/initiate'
  s.license = 'MIT'
  s.name = 'initiate'
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.summary = "Generate a Rails app using thoughtbot's best practices."
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = Initiate::VERSION

  s.add_dependency 'bundler', '~> 1.3'
  s.add_dependency 'rails', Initiate::RAILS_VERSION

  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'pry'
end
