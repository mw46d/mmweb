# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{will_paginate}
  s.version = "3.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mislav Marohnić"]
  s.date = %q{2012-01-31}
  s.description = %q{will_paginate provides a simple API for performing paginated queries with Active Record, DataMapper and Sequel, and includes helpers for rendering pagination links in Rails, Sinatra and Merb web apps.}
  s.email = %q{mislav.marohnic@gmail.com}
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.files = ["Rakefile", "lib/will_paginate/active_record.rb", "lib/will_paginate/array.rb", "lib/will_paginate/collection.rb", "lib/will_paginate/core_ext.rb", "lib/will_paginate/data_mapper.rb", "lib/will_paginate/deprecation.rb", "lib/will_paginate/i18n.rb", "lib/will_paginate/locale/en.yml", "lib/will_paginate/page_number.rb", "lib/will_paginate/per_page.rb", "lib/will_paginate/railtie.rb", "lib/will_paginate/sequel.rb", "lib/will_paginate/version.rb", "lib/will_paginate/view_helpers/action_view.rb", "lib/will_paginate/view_helpers/link_renderer.rb", "lib/will_paginate/view_helpers/link_renderer_base.rb", "lib/will_paginate/view_helpers/merb.rb", "lib/will_paginate/view_helpers/sinatra.rb", "lib/will_paginate/view_helpers.rb", "lib/will_paginate.rb", "spec/ci.rb", "spec/collection_spec.rb", "spec/console", "spec/console_fixtures.rb", "spec/database.yml", "spec/finders/active_record_spec.rb", "spec/finders/activerecord_test_connector.rb", "spec/finders/data_mapper_spec.rb", "spec/finders/data_mapper_test_connector.rb", "spec/finders/sequel_spec.rb", "spec/finders/sequel_test_connector.rb", "spec/fixtures/admin.rb", "spec/fixtures/developer.rb", "spec/fixtures/developers_projects.yml", "spec/fixtures/project.rb", "spec/fixtures/projects.yml", "spec/fixtures/replies.yml", "spec/fixtures/reply.rb", "spec/fixtures/schema.rb", "spec/fixtures/topic.rb", "spec/fixtures/topics.yml", "spec/fixtures/user.rb", "spec/fixtures/users.yml", "spec/page_number_spec.rb", "spec/per_page_spec.rb", "spec/spec_helper.rb", "spec/view_helpers/action_view_spec.rb", "spec/view_helpers/base_spec.rb", "spec/view_helpers/link_renderer_base_spec.rb", "spec/view_helpers/view_example_group.rb", "README.md", "LICENSE"]
  s.homepage = %q{https://github.com/mislav/will_paginate/wiki}
  s.rdoc_options = ["--main", "README.md", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Pagination plugin for web frameworks and other apps}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
