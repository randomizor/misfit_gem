require 'misfit_gem/errors'
require 'misfit_gem/helpers'
require 'misfit_gem/version'
require 'misfit_gem/profile'
require 'misfit_gem/device'
require 'misfit_gem/goals'
require 'misfit_gem/summary'
require 'misfit_gem/sessions'
require 'misfit_gem/sleeps'
require 'date'
require 'uri'

module MisfitGem
  class Client
    API_VERSION = 'v1'
    EMPTY_BODY = ''

    attr_accessor :api_version

    def initialize(opts)
      missing = [:consumer_key, :consumer_secret] - opts.keys
      if missing.size > 0
        raise MisfitGem::InvalidArgumentError, "Missing required options: #{missing.join(',')}"
      end
      @consumer_key = opts[:consumer_key]
      @consumer_secret = opts[:consumer_secret]

      @token = opts[:token]
      @secret = opts[:secret]

      @proxy = opts[:proxy] if opts[:proxy]

      @api_version = API_VERSION
    end

    def authorize(token, secret, opts={})
      request_token = OAuth::RequestToken.new(consumer, token, secret)
      @access_token = request_token.get_access_token(opts)
      @token = @access_token.token
      @secret = @access_token.secret
      @access_token
    end

    def reconnect(token, secret)
      @access_token = nil
      @token = token
      @secret = secret
      access_token
    end
    
    def connected?
      !@access_token.nil?
    end

    def request_token(opts={})
      consumer.get_request_token(opts)
    end

    def authentication_request_token(opts={})
      consumer.options[:authorize_path] = '/oauth/authenticate'
      request_token(opts)
    end

    private

      def consumer
        @consumer ||= OAuth::Consumer.new(@consumer_key, @consumer_secret, {
          :site => 'https://api.misfitwearables.com',
          :proxy => @proxy
        })
      end

      def access_token
        @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
      end

      def get(path)
        extract_response_body raw_get(path)
      end

      def raw_get(path)
        headers = {'User-Agent' => "misfit_gem gem v#{MisfitGem::VERSION}", 'access_token' => @token}
        uri = "/move/resource/#{@api_version}#{path}"
        
        access_token.get(uri, headers)
      end

      def extract_response_body(resp)
        resp.nil? || resp.body.nil? ? {} : JSON.parse(resp.body)
      end
      
  end
end
