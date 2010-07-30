require 'rack'
require 'erb'

module Rack

  class JavascriptInject
    
    def initialize(app, options = {})
      @app, @options = app
    end

    def call(env); dup._call(env); end

    def _call(env)
      @status, @headers, @response = @app.call(env)
      
      if html? 
        response = Rack::Response.new([], @status, @headers)
        @response.each { |fragment| response.write inject(fragment) }
        response.finish
      else
        [@status, @headers, @response]
      end
    end

    private

    def html?
      @headers['Content-Type'] =~ /html/
    end

    def inject(response)
      @template ||= ::ERB.new ::File.read ::File.expand_path("../templates/javascript_inject.erb", __FILE__)
      response.gsub(%r{</body>}, "</body>" + @template.result(binding))
    end

  end

end