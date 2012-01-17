$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pawi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pawi"
  s.version     = Pawi::VERSION
  s.authors     = ["Onur Uyar"]
  s.email       = ["me@onuruyar.com"]
  s.homepage    = "http://github.com/lemmycaution/pawi"
  s.summary     = "A gem to manage dynamic pages"
  s.description = "A gem to manage dynamic pages"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"
  s.add_dependency 'globalize3'
  s.add_dependency 'routing-filter'  
  s.add_dependency 'activeadmin'
  s.add_dependency 'tinymce-rails'  

  s.add_development_dependency "sqlite3"
end
