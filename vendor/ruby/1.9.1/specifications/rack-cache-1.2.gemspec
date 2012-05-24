# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rack-cache}
  s.version = "1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Tomayko"]
  s.date = %q{2012-03-05}
  s.description = %q{Rack::Cache is suitable as a quick drop-in component to enable HTTP caching for Rack-based applications that produce freshness (Expires, Cache-Control) and/or validation (Last-Modified, ETag) information.}
  s.email = %q{r@tomayko.com}
  s.extra_rdoc_files = ["README", "COPYING", "TODO", "CHANGES"]
  s.files = ["CHANGES", "COPYING", "Gemfile", "README", "Rakefile", "TODO", "doc/configuration.markdown", "doc/faq.markdown", "doc/index.markdown", "doc/layout.html.erb", "doc/license.markdown", "doc/rack-cache.css", "doc/server.ru", "doc/storage.markdown", "example/sinatra/app.rb", "example/sinatra/views/index.erb", "lib/rack-cache.rb", "lib/rack/cache.rb", "lib/rack/cache/appengine.rb", "lib/rack/cache/cachecontrol.rb", "lib/rack/cache/context.rb", "lib/rack/cache/entitystore.rb", "lib/rack/cache/key.rb", "lib/rack/cache/metastore.rb", "lib/rack/cache/options.rb", "lib/rack/cache/request.rb", "lib/rack/cache/response.rb", "lib/rack/cache/storage.rb", "rack-cache.gemspec", "test/cache_test.rb", "test/cachecontrol_test.rb", "test/context_test.rb", "test/entitystore_test.rb", "test/key_test.rb", "test/metastore_test.rb", "test/options_test.rb", "test/pony.jpg", "test/request_test.rb", "test/response_test.rb", "test/spec_setup.rb", "test/storage_test.rb"]
  s.homepage = %q{http://tomayko.com/src/rack-cache/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rack::Cache", "--main", "Rack::Cache"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{HTTP Caching for Rack}
  s.test_files = ["test/cache_test.rb", "test/cachecontrol_test.rb", "test/context_test.rb", "test/entitystore_test.rb", "test/key_test.rb", "test/metastore_test.rb", "test/options_test.rb", "test/request_test.rb", "test/response_test.rb", "test/storage_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0.4"])
      s.add_development_dependency(%q<bacon>, [">= 0"])
      s.add_development_dependency(%q<memcached>, [">= 0"])
      s.add_development_dependency(%q<dalli>, [">= 0"])
    else
      s.add_dependency(%q<rack>, [">= 0.4"])
      s.add_dependency(%q<bacon>, [">= 0"])
      s.add_dependency(%q<memcached>, [">= 0"])
      s.add_dependency(%q<dalli>, [">= 0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0.4"])
    s.add_dependency(%q<bacon>, [">= 0"])
    s.add_dependency(%q<memcached>, [">= 0"])
    s.add_dependency(%q<dalli>, [">= 0"])
  end
end
