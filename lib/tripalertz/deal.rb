require 'rest-client'
require 'crack'
require 'active_support/core_ext/string'
module TRIPALERTZ
  class Deal
    attr_accessor :auth_login, :auth_key, :url, :timeout, :open_timeout
    def initialize(args={})
      @auth_login = TRIPALERTZ.auth_login
      @auth_key = TRIPALERTZ.auth_key
      @url = TRIPALERTZ.url
      @timeout = TRIPALERTZ.timeout.to_i
      @open_timeout = TRIPALERTZ.open_timeout.to_i
    end

    def GetCurrentDeals()
      @response = RestClient::Request.execute(:method => :get, :url => [@url,'getCurrentDeals'].join, :headers => { :'X-Auth-Login' => '1', :'X-Auth-Key'=> '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8'}, :timeout => @timeout, :open_timeout => @open_timeout)
      puts @response
    end

    private


  end

end

