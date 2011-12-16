# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "batcher/version"

Gem::Specification.new do |s|
  s.name        = "batcher"
  s.version     = Batcher::VERSION
  s.authors     = ["Harold Giménez"]
  s.email       = ["hgimenez@thoughtbot.com"]
  s.homepage    = ""
  s.summary     = %q{Data batch processing for ActiveRecord}
  s.description = %q{Allows you to process many records in batches. Similar to #find_each in ActiveRecord, but allows you to specify a slicing attribute that is not the table's primary key}

  s.rubyforge_project = "batcher"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "activerecord"

  s.add_development_dependency "rspec"
  s.add_development_dependency "pg"
end
