require 'routing_filter/filter'

module RoutingFilter
  class Small < Filter
    # Locate and remove the small marker from the beginning of the
    # path, pass the path along to the given block and set the small
    # parameter.
    def around_recognize(path, env, &block)
      small = extract_segment!(%r{^/(small)(?=/|$)}, path)
      yield(path, env).tap do |params|
        params[:small] = true if small
      end
    end

    def around_generate(*args, &block)
      small = args.extract_options!.delete(:small)
      yield.tap do |result|
        if small
          url = result.is_a?(Array) ? result.first : result
          url.sub!(%r{^(http.?://[^/]*)?(.*)}) { "#{$1}/small#{$2}" }
        end
      end
    end
  end

  autoload :Small, 'small'
end

