require 'routing_filter/base'

module RoutingFilter
  class Small < Base
    # Locate and remove the small marker from the beginning of the
    # path, pass the path along to the given block and set the small
    # parameter.
    def around_recognize(path, env, &block)
      small = extract_small!(path)
      returning yield(path, env) do |params|
        params[:small] = true if small
      end
    end

    def around_generate(*args, &block)
      small = args.extract_options!.delete(:small)
      returning yield do |result|
        if small
          url = result.is_a?(Array) ? result.first : result
          url.sub!(%r{^(http.?://[^/]*)?(.*)}) { "#{$1}/small#{$2}" }
        end
      end
    end

    protected
    def extract_small!(path)
      path.sub! %r{^/(small)(?=/|$)}, ''
      $1
    end
  end
end
