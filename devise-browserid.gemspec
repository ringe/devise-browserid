# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "devise-browserid/version"

Gem::Specification.new do |s|
  s.name        = "devise-browserid"
  s.version     = Devise::Browserid::VERSION
  s.authors     = ["ringe"]
  s.email       = ["runar@rin.no"]
  s.homepage    = "https://github.com/ringe/devise-browserid"
  s.description   = %q{BrowserID helpers for Devise}
  s.summary       = %q{Authenticate your Devise/Warden-enabled Rails app using BrowserID from Mozilla}

  s.rubyforge_project = "devise-browserid"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "warden-browserid"
  s.add_dependency "devise"
end
