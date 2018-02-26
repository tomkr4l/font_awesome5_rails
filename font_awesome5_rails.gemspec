$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "font_awesome5_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "font_awesome5_rails"
  s.version     = FontAwesome5Rails::VERSION
  s.authors     = ["tomkra"]
  s.email       = ["kralutomas@gmail.com"]
  s.homepage    = "https://github.com/tomkra/font_awesome5_rails"
  s.summary     = "an asset gemification of the font-awesome 5 icon font library"
  s.description = "font_awesome5_rails provides Font-Awesome 5 support."
  s.license     = "MIT"

  s.files = Dir["{app,config,bin,lib,spec}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "railties", ">= 4.2", "< 5.2"

  s.add_development_dependency "activesupport"
  s.add_development_dependency "sass-rails"
  s.required_ruby_version = ">= 2.0.0"
end
