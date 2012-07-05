require 'tripalertz/deal.rb'
module TRIPALERTZ
  class << self
    attr_accessor :auth_login
    attr_accessor :auth_key
    attr_accessor :url
    attr_accessor :timeout
    attr_accessor :open_timeout
  end
  def self.configure(&block)
    yield(self)
  end
end

