# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/ftw/cas/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-ftw-cas"
  spec.version       = OmniAuth::Ftw::CAS::VERSION
  spec.authors       = ["Yves Senn"]
  spec.email         = ["yves.senn@gmail.com"]
  spec.summary       = %q{OmniAuth strategy to authenticate against our internal CAS.}
  spec.description   = %q{Provides single sign-on for our internal applications.}
  spec.homepage      = "https://github.com/4teamwork/omniauth-ftw-cas"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth-cas"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
