# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{reloader}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeroen van Dijk"]
  s.date = %q{2010-07-30}
  s.default_executable = %q{reloader}
  s.description = %q{Reloads your pages and assets automatically in your Rails app. Heavily inspired by Livereload}
  s.email = %q{jeroen@jeevidee.nl}
  s.executables = ["reloader"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "Gemfile",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "TODO.md",
     "VERSION",
     "app/controllers/reloader/reloader_controller.rb",
     "bin/reloader",
     "config/routes.rb",
     "lib/config.ru",
     "lib/rack/javascript_inject.rb",
     "lib/rack/templates/javascript_inject.erb",
     "lib/reloader.rb",
     "lib/reloader/rails.rb",
     "public/javascripts/faye-browser.js",
     "public/javascripts/jquery.js",
     "public/javascripts/reloader.js"
  ]
  s.homepage = %q{http://github.com/jeroenvandijk/reloader}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Reloads your pages and assets automatically in your Rails app}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspactor>, ["= 0.7.0.beta.5"])
      s.add_runtime_dependency(%q<faye>, ["= 0.5.0"])
      s.add_runtime_dependency(%q<thin>, ["= 1.2.7"])
      s.add_runtime_dependency(%q<rev>, ["= 0.3.2"])
    else
      s.add_dependency(%q<rspactor>, ["= 0.7.0.beta.5"])
      s.add_dependency(%q<faye>, ["= 0.5.0"])
      s.add_dependency(%q<thin>, ["= 1.2.7"])
      s.add_dependency(%q<rev>, ["= 0.3.2"])
    end
  else
    s.add_dependency(%q<rspactor>, ["= 0.7.0.beta.5"])
    s.add_dependency(%q<faye>, ["= 0.5.0"])
    s.add_dependency(%q<thin>, ["= 1.2.7"])
    s.add_dependency(%q<rev>, ["= 0.3.2"])
  end
end
