# -*- encoding: utf-8 -*-
# stub: quest 1.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "quest".freeze
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kevin Henner".freeze]
  s.date = "2017-07-24"
  s.description = "quest uses serverspec to track completion of configuration management related learning tasks.".freeze
  s.email = ["kevin@puppetlabs.com".freeze]
  s.executables = ["quest".freeze, "questctl".freeze, "test_all_quests".freeze]
  s.files = ["bin/quest".freeze, "bin/questctl".freeze, "bin/test_all_quests".freeze]
  s.homepage = "http://github.com/puppetlabs/quest".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Track completion of configuration management tasks.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, ["~> 4.2"])
    s.add_runtime_dependency(%q<serverspec>.freeze, ["~> 2.36"])
    s.add_runtime_dependency(%q<json>.freeze, ["~> 1.7"])
    s.add_runtime_dependency(%q<rack>.freeze, ["~> 1.6"])
    s.add_runtime_dependency(%q<gli>.freeze, ["~> 2.12"])
    s.add_runtime_dependency(%q<mono_logger>.freeze, ["~> 1.1"])
    s.add_runtime_dependency(%q<sinatra>.freeze, ["~> 1.4"])
    s.add_runtime_dependency(%q<highline>.freeze, ["~> 1.7"])
    s.add_runtime_dependency(%q<net-ssh>.freeze, ["~> 4.1"])
    s.add_runtime_dependency(%q<timers>.freeze, ["~> 4.1"])
    s.add_runtime_dependency(%q<hitimes>.freeze, ["~> 1.2"])
    s.add_runtime_dependency(%q<gettext-setup>.freeze, ["~> 0.24"])
  else
    s.add_dependency(%q<activesupport>.freeze, ["~> 4.2"])
    s.add_dependency(%q<serverspec>.freeze, ["~> 2.36"])
    s.add_dependency(%q<json>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rack>.freeze, ["~> 1.6"])
    s.add_dependency(%q<gli>.freeze, ["~> 2.12"])
    s.add_dependency(%q<mono_logger>.freeze, ["~> 1.1"])
    s.add_dependency(%q<sinatra>.freeze, ["~> 1.4"])
    s.add_dependency(%q<highline>.freeze, ["~> 1.7"])
    s.add_dependency(%q<net-ssh>.freeze, ["~> 4.1"])
    s.add_dependency(%q<timers>.freeze, ["~> 4.1"])
    s.add_dependency(%q<hitimes>.freeze, ["~> 1.2"])
    s.add_dependency(%q<gettext-setup>.freeze, ["~> 0.24"])
  end
end
