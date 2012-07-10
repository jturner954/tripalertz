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

    def current
      @response = RestClient::Request.execute(:method => :get, :url => [@url,'getCurrentDeals'].join, :headers => { :'X-Auth-Login' => '1', :'X-Auth-Key'=> '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8'}, :timeout => @timeout, :open_timeout => @open_timeout)
      puts @response
    end

     def all
       '/api/3/deals'
     end

     def find(id)
       '/api/3/deal/DEAL_ID'
     end

     #status: hold, release
     def inventory(deal_id, status)
       '/api/3/deal/DEAL_ID/inventory/'
     end

     def book(deal_id)
        '/api/3/deal/DEAL_ID/book'
     end

     def headers(options)
      {
        :x_auth_login => ENV['TRIPALERTZ_ACCOUNT_NUMBER'],
        :x_auth_key => ENV['TRIPALERTZ_AUTH_KEY']
      }
    end

    def deals_options(options)
      options = {
        :date_start => 'YYYY-MM-DD',
        :date_end => 'YYYY-MM-DD',
        :currency => 'USD',
        :price_min => '10.00',
        :price_max => '50.00',
        :exclude_countries => 'CA,VEN',
        :include_countries => 'USA,UK',
        :status => '1',               #current:1, upcoming:2, closed:3
        :rooms => [
          {
          :room_type_id => 5,
          :first_name => 'first',
          :last_name => 'last',
          :num_adults => 1,
          :num_children => 0
          }
        ],
        :first_name => '',
        :last_name => '',
        :phone => '',
        :email => '',
        :cc_num => '',
        :cc_exp => 'MM/YY',
        :cc_cv2 => '',
        :billing_address_line_1 => '',
        :billing_address_line_2 => '',
        :billing_city => '',
        :billing_state_id => 5,
        :billing_country_id => '',
        :hold_id => ''
      }
    end

    def hold_options(options)
      options = {
        :test_mode => 1,        #0: live, 1: testing
        :date_checkin => 'YYYY-MM-DD',
        :date_checkout => 'YYYY-MM-DD',
        :rooms => [
          {
          :room_type_id => 5,
          :first_name => 'first',
          :last_name => 'last',
          :num_adults => 1,
          :num_children => 0
          }
        ],
        :first_name => '',
        :last_name => '',
        :phone => '',
        :email => '',
        :cc_num => '',
        :cc_exp => 'MM/YY',
        :cc_cv2 => '',
        :billing_address_line_1 => '',
        :billing_address_line_2 => '',
        :billing_city => '',
        :billing_state_id => 5,
        :billing_country_id => '',
        :hold_id => ''
      }
    end

    def regular_booking_options(options)
      options = {
        :test_mode => 1,        #0: live, 1: testing
        :date_checkin => 'YYYY-MM-DD',
        :date_checkout => 'YYYY-MM-DD',
        :rooms => [
          {
          :room_type_id => 5,
          :first_name => 'first',
          :last_name => 'last',
          :num_adults => 1,
          :num_children => 0
          }
        ],
        :first_name => '',
        :last_name => '',
        :phone => '',
        :email => '',
        :cc_num => '',
        :cc_exp => 'MM/YY',
        :cc_cv2 => '',
        :billing_address_line_1 => '',
        :billing_address_line_2 => '',
        :billing_city => '',
        :billing_state_id => 5,
        :billing_country_id => '',
        :hold_id => ''
      }
    end

    def voucher_booking_options(options)
      options = {
        :test_mode => 1,        #0: live, 1: testing
        :num_vouchers => '',
        :first_name => '',
        :last_name => '',
        :phone => '',
        :email => '',
        :cc_num => '',
        :cc_exp => 'MM/YY',
        :cc_cv2 => '',
        :billing_address_line_1 => '',
        :billing_address_line_2 => '',
        :billing_city => '',
        :billing_state_id => 5,
        :billing_country_id => '',
        :hold_id => ''
      }
    end

    def register_options(options)
      options = {
        :username => '',    #email
        :password => '',
        :first_name => '',
        :last_name => '',
        :zip_code => ''
      }
    end

  end

end

