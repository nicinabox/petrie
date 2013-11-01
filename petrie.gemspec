$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "petrie/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "petrie"
  s.version     = Petrie::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Petrie."
  s.description = "TODO: Description of Petrie."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "awesome_nested_set", "~> 2.1.6"
  s.add_dependency 'friendly_id', '~> 5.0.0'

  s.add_development_dependency "sqlite3"
end
