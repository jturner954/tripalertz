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

    private


  end

end

