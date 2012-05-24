# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{coffee-rails}
  s.version = "3.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Santiago Pastorino"]
  s.date = %q{2012-01-26}
  s.description = %q{Coffee Script adapter for the Rails asset pipeline.}
  s.email = ["santiago@wyeworks.com"]
  s.files = [".gitignore", ".travis.yml", "Gemfile", "MIT-LICENSE", "README.markdown", "Rakefile", "coffee-rails.gemspec", "lib/assets/javascripts/coffee-script.js.erb", "lib/coffee-rails.rb", "lib/coffee/rails/engine.rb", "lib/coffee/rails/template_handler.rb", "lib/coffee/rails/version.rb", "lib/rails/generators/coffee/assets/assets_generator.rb", "lib/rails/generators/coffee/assets/templates/javascript.js.coffee", "test/assets_generator_test.rb", "test/assets_test.rb", "test/controller_generator_test.rb", "test/scaffold_generator_test.rb", "test/support/routes.rb", "test/support/site/index.js.coffee", "test/template_handler_test.rb", "test/test_helper.rb"]
  s.homepage = %q{}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{coffee-rails}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Coffee Script adapter for the Rails asset pipeline.}
  s.test_files = ["test/assets_generator_test.rb", "test/assets_test.rb", "test/controller_generator_test.rb", "test/scaffold_generator_test.rb", "test/support/routes.rb", "test/support/site/index.js.coffee", "test/template_handler_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<coffee-script>, [">= 2.2.0"])
      s.add_runtime_dependency(%q<railties>, ["~> 3.2.0"])
    else
      s.add_dependency(%q<coffee-script>, [">= 2.2.0"])
      s.add_dependency(%q<railties>, ["~> 3.2.0"])
    end
  else
    s.add_dependency(%q<coffee-script>, [">= 2.2.0"])
    s.add_dependency(%q<railties>, ["~> 3.2.0"])
  end
end
