# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{actionpack}
  s.version = "3.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Heinemeier Hansson"]
  s.date = %q{2012-03-29}
  s.description = %q{Web apps on Rails. Simple, battle-tested conventions for building and testing MVC web applications. Works with any Rack-compatible server.}
  s.email = %q{david@loudthinking.com}
  s.files = ["CHANGELOG.md", "README.rdoc", "MIT-LICENSE", "lib/abstract_controller/asset_paths.rb", "lib/abstract_controller/base.rb", "lib/abstract_controller/callbacks.rb", "lib/abstract_controller/collector.rb", "lib/abstract_controller/helpers.rb", "lib/abstract_controller/layouts.rb", "lib/abstract_controller/logger.rb", "lib/abstract_controller/railties/routes_helpers.rb", "lib/abstract_controller/rendering.rb", "lib/abstract_controller/translation.rb", "lib/abstract_controller/url_for.rb", "lib/abstract_controller/view_paths.rb", "lib/abstract_controller.rb", "lib/action_controller/base.rb", "lib/action_controller/caching/actions.rb", "lib/action_controller/caching/fragments.rb", "lib/action_controller/caching/pages.rb", "lib/action_controller/caching/sweeping.rb", "lib/action_controller/caching.rb", "lib/action_controller/deprecated/integration_test.rb", "lib/action_controller/deprecated/performance_test.rb", "lib/action_controller/deprecated.rb", "lib/action_controller/log_subscriber.rb", "lib/action_controller/metal/compatibility.rb", "lib/action_controller/metal/conditional_get.rb", "lib/action_controller/metal/cookies.rb", "lib/action_controller/metal/data_streaming.rb", "lib/action_controller/metal/exceptions.rb", "lib/action_controller/metal/flash.rb", "lib/action_controller/metal/force_ssl.rb", "lib/action_controller/metal/head.rb", "lib/action_controller/metal/helpers.rb", "lib/action_controller/metal/hide_actions.rb", "lib/action_controller/metal/http_authentication.rb", "lib/action_controller/metal/implicit_render.rb", "lib/action_controller/metal/instrumentation.rb", "lib/action_controller/metal/mime_responds.rb", "lib/action_controller/metal/params_wrapper.rb", "lib/action_controller/metal/rack_delegation.rb", "lib/action_controller/metal/redirecting.rb", "lib/action_controller/metal/renderers.rb", "lib/action_controller/metal/rendering.rb", "lib/action_controller/metal/request_forgery_protection.rb", "lib/action_controller/metal/rescue.rb", "lib/action_controller/metal/responder.rb", "lib/action_controller/metal/session_management.rb", "lib/action_controller/metal/streaming.rb", "lib/action_controller/metal/testing.rb", "lib/action_controller/metal/url_for.rb", "lib/action_controller/metal.rb", "lib/action_controller/middleware.rb", "lib/action_controller/railtie.rb", "lib/action_controller/railties/paths.rb", "lib/action_controller/record_identifier.rb", "lib/action_controller/test_case.rb", "lib/action_controller/vendor/html-scanner/html/document.rb", "lib/action_controller/vendor/html-scanner/html/node.rb", "lib/action_controller/vendor/html-scanner/html/sanitizer.rb", "lib/action_controller/vendor/html-scanner/html/selector.rb", "lib/action_controller/vendor/html-scanner/html/tokenizer.rb", "lib/action_controller/vendor/html-scanner/html/version.rb", "lib/action_controller/vendor/html-scanner.rb", "lib/action_controller.rb", "lib/action_dispatch/http/cache.rb", "lib/action_dispatch/http/filter_parameters.rb", "lib/action_dispatch/http/headers.rb", "lib/action_dispatch/http/mime_negotiation.rb", "lib/action_dispatch/http/mime_type.rb", "lib/action_dispatch/http/mime_types.rb", "lib/action_dispatch/http/parameter_filter.rb", "lib/action_dispatch/http/parameters.rb", "lib/action_dispatch/http/rack_cache.rb", "lib/action_dispatch/http/request.rb", "lib/action_dispatch/http/response.rb", "lib/action_dispatch/http/upload.rb", "lib/action_dispatch/http/url.rb", "lib/action_dispatch/middleware/best_standards_support.rb", "lib/action_dispatch/middleware/body_proxy.rb", "lib/action_dispatch/middleware/callbacks.rb", "lib/action_dispatch/middleware/cookies.rb", "lib/action_dispatch/middleware/debug_exceptions.rb", "lib/action_dispatch/middleware/exception_wrapper.rb", "lib/action_dispatch/middleware/flash.rb", "lib/action_dispatch/middleware/head.rb", "lib/action_dispatch/middleware/params_parser.rb", "lib/action_dispatch/middleware/public_exceptions.rb", "lib/action_dispatch/middleware/reloader.rb", "lib/action_dispatch/middleware/remote_ip.rb", "lib/action_dispatch/middleware/request_id.rb", "lib/action_dispatch/middleware/rescue.rb", "lib/action_dispatch/middleware/session/abstract_store.rb", "lib/action_dispatch/middleware/session/cache_store.rb", "lib/action_dispatch/middleware/session/cookie_store.rb", "lib/action_dispatch/middleware/session/mem_cache_store.rb", "lib/action_dispatch/middleware/show_exceptions.rb", "lib/action_dispatch/middleware/stack.rb", "lib/action_dispatch/middleware/static.rb", "lib/action_dispatch/middleware/templates/rescues/_request_and_response.erb", "lib/action_dispatch/middleware/templates/rescues/_trace.erb", "lib/action_dispatch/middleware/templates/rescues/diagnostics.erb", "lib/action_dispatch/middleware/templates/rescues/layout.erb", "lib/action_dispatch/middleware/templates/rescues/missing_template.erb", "lib/action_dispatch/middleware/templates/rescues/routing_error.erb", "lib/action_dispatch/middleware/templates/rescues/template_error.erb", "lib/action_dispatch/middleware/templates/rescues/unknown_action.erb", "lib/action_dispatch/railtie.rb", "lib/action_dispatch/routing/mapper.rb", "lib/action_dispatch/routing/polymorphic_routes.rb", "lib/action_dispatch/routing/redirection.rb", "lib/action_dispatch/routing/route_set.rb", "lib/action_dispatch/routing/routes_proxy.rb", "lib/action_dispatch/routing/url_for.rb", "lib/action_dispatch/routing.rb", "lib/action_dispatch/testing/assertions/dom.rb", "lib/action_dispatch/testing/assertions/response.rb", "lib/action_dispatch/testing/assertions/routing.rb", "lib/action_dispatch/testing/assertions/selector.rb", "lib/action_dispatch/testing/assertions/tag.rb", "lib/action_dispatch/testing/assertions.rb", "lib/action_dispatch/testing/integration.rb", "lib/action_dispatch/testing/performance_test.rb", "lib/action_dispatch/testing/test_process.rb", "lib/action_dispatch/testing/test_request.rb", "lib/action_dispatch/testing/test_response.rb", "lib/action_dispatch.rb", "lib/action_pack/version.rb", "lib/action_pack.rb", "lib/action_view/asset_paths.rb", "lib/action_view/base.rb", "lib/action_view/buffers.rb", "lib/action_view/context.rb", "lib/action_view/flows.rb", "lib/action_view/helpers/active_model_helper.rb", "lib/action_view/helpers/asset_paths.rb", "lib/action_view/helpers/asset_tag_helper.rb", "lib/action_view/helpers/asset_tag_helpers/asset_include_tag.rb", "lib/action_view/helpers/asset_tag_helpers/asset_paths.rb", "lib/action_view/helpers/asset_tag_helpers/javascript_tag_helpers.rb", "lib/action_view/helpers/asset_tag_helpers/stylesheet_tag_helpers.rb", "lib/action_view/helpers/atom_feed_helper.rb", "lib/action_view/helpers/cache_helper.rb", "lib/action_view/helpers/capture_helper.rb", "lib/action_view/helpers/controller_helper.rb", "lib/action_view/helpers/csrf_helper.rb", "lib/action_view/helpers/date_helper.rb", "lib/action_view/helpers/debug_helper.rb", "lib/action_view/helpers/form_helper.rb", "lib/action_view/helpers/form_options_helper.rb", "lib/action_view/helpers/form_tag_helper.rb", "lib/action_view/helpers/javascript_helper.rb", "lib/action_view/helpers/number_helper.rb", "lib/action_view/helpers/output_safety_helper.rb", "lib/action_view/helpers/record_tag_helper.rb", "lib/action_view/helpers/rendering_helper.rb", "lib/action_view/helpers/sanitize_helper.rb", "lib/action_view/helpers/tag_helper.rb", "lib/action_view/helpers/text_helper.rb", "lib/action_view/helpers/translation_helper.rb", "lib/action_view/helpers/url_helper.rb", "lib/action_view/helpers.rb", "lib/action_view/locale/en.yml", "lib/action_view/log_subscriber.rb", "lib/action_view/lookup_context.rb", "lib/action_view/path_set.rb", "lib/action_view/railtie.rb", "lib/action_view/renderer/abstract_renderer.rb", "lib/action_view/renderer/partial_renderer.rb", "lib/action_view/renderer/renderer.rb", "lib/action_view/renderer/streaming_template_renderer.rb", "lib/action_view/renderer/template_renderer.rb", "lib/action_view/template/error.rb", "lib/action_view/template/handlers/builder.rb", "lib/action_view/template/handlers/erb.rb", "lib/action_view/template/handlers.rb", "lib/action_view/template/resolver.rb", "lib/action_view/template/text.rb", "lib/action_view/template.rb", "lib/action_view/test_case.rb", "lib/action_view/testing/resolvers.rb", "lib/action_view.rb", "lib/sprockets/assets.rake", "lib/sprockets/bootstrap.rb", "lib/sprockets/compressors.rb", "lib/sprockets/helpers/isolated_helper.rb", "lib/sprockets/helpers/rails_helper.rb", "lib/sprockets/helpers.rb", "lib/sprockets/railtie.rb", "lib/sprockets/static_compiler.rb"]
  s.homepage = %q{http://www.rubyonrails.org}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.requirements = ["none"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Web-flow and rendering framework putting the VC in MVC (part of Rails).}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["= 3.2.3"])
      s.add_runtime_dependency(%q<activemodel>, ["= 3.2.3"])
      s.add_runtime_dependency(%q<rack-cache>, ["~> 1.2"])
      s.add_runtime_dependency(%q<builder>, ["~> 3.0.0"])
      s.add_runtime_dependency(%q<rack>, ["~> 1.4.0"])
      s.add_runtime_dependency(%q<rack-test>, ["~> 0.6.1"])
      s.add_runtime_dependency(%q<journey>, ["~> 1.0.1"])
      s.add_runtime_dependency(%q<sprockets>, ["~> 2.1.2"])
      s.add_runtime_dependency(%q<erubis>, ["~> 2.7.0"])
      s.add_development_dependency(%q<tzinfo>, ["~> 0.3.29"])
    else
      s.add_dependency(%q<activesupport>, ["= 3.2.3"])
      s.add_dependency(%q<activemodel>, ["= 3.2.3"])
      s.add_dependency(%q<rack-cache>, ["~> 1.2"])
      s.add_dependency(%q<builder>, ["~> 3.0.0"])
      s.add_dependency(%q<rack>, ["~> 1.4.0"])
      s.add_dependency(%q<rack-test>, ["~> 0.6.1"])
      s.add_dependency(%q<journey>, ["~> 1.0.1"])
      s.add_dependency(%q<sprockets>, ["~> 2.1.2"])
      s.add_dependency(%q<erubis>, ["~> 2.7.0"])
      s.add_dependency(%q<tzinfo>, ["~> 0.3.29"])
    end
  else
    s.add_dependency(%q<activesupport>, ["= 3.2.3"])
    s.add_dependency(%q<activemodel>, ["= 3.2.3"])
    s.add_dependency(%q<rack-cache>, ["~> 1.2"])
    s.add_dependency(%q<builder>, ["~> 3.0.0"])
    s.add_dependency(%q<rack>, ["~> 1.4.0"])
    s.add_dependency(%q<rack-test>, ["~> 0.6.1"])
    s.add_dependency(%q<journey>, ["~> 1.0.1"])
    s.add_dependency(%q<sprockets>, ["~> 2.1.2"])
    s.add_dependency(%q<erubis>, ["~> 2.7.0"])
    s.add_dependency(%q<tzinfo>, ["~> 0.3.29"])
  end
end
