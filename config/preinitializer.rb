# Load vendored gems
require File.join(RAILS_ROOT, 'vendor', 'gems')

require 'jruby/openssl/gem_only' if RUBY_PLATFORM =~ /java/