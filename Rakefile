require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "reloader"
    gem.summary = %Q{Reloads your pages and assets automatically in your Rails app}
    gem.description = %Q{Reloads your pages and assets automatically in your Rails app. Heavily inspired by Livereload}
    gem.email = "jeroen@jeevidee.nl"
    gem.homepage = "http://github.com/jeroenvandijk/reloader"
    gem.authors = ["Jeroen van Dijk"]
    gem.add_dependency "rspactor", ">= 0.7.0.beta.5"
    gem.add_dependency "faye", ">= 0.5.0"
    gem.add_dependency "thin", ">= 1.2.7"
    gem.add_dependency "rev",  ">= 0.3.2"
    gem.files =  FileList["[A-Z]*", "{app,bin,config,lib,public}/**/*"]

    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "reloader #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
