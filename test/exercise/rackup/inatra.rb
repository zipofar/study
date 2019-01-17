module Inatra
  class << self
    def routes(&block)
      @routes = []
      instance_eval(&block)
    end

    def method_missing(method, *args, &block)
      path = args.first
      @routes << { method: method.upcase.to_s, path: path, block: block }
    end

    def call(env)
      method = env['REQUEST_METHOD'].upcase
      path = env['PATH_INFO']
      @routes.each do |route|
        return route[:block].call if path == route[:path] && method == route[:method]
      end
    end
  end
end
