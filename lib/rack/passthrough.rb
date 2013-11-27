require "rack/passthrough/version"
require "httparty"

module Rack
  module Passthrough

    class Endpoint
      def initialize( endpoint )
        raise "Required api endpoint path." if endpoint.blank?
        @endpoint = endpoint
      end

      def to_normal_string(data)
        if data.class == Array
          data = data.join
        else
          data
        end

        data
      end

      def call(env)
        request = Rack::Request.new(env)
        full_path = URI::join( @endpoint, request.path )
        # Set Query String
        full_path.query = request.query_string
        data = request.body.read
        # body_data = JSON.parse( data ) unless data.blank?
        # body_data = Rack::Utils.parse_query( data ) unless data.blank?
        conn = HTTParty.method( request.request_method.downcase.to_sym )

        # Request to endpoint
        response = conn.call( full_path.to_s, { body: env["action_dispatch.request.request_parameters"] } )
        headers = {}

        response.headers.each do |key,value|
          headers.merge!({ key => to_normal_string(value) })

        end

        [ response.code , headers , [response.body] ]
      end
    end
    
  end
end
