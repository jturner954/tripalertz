require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Tripalertz' do
  describe 'Deal' do
    before do
      TRIPALERTZ.configure do |config|
        config.auth_login = auth_login
        config.auth_key = auth_key
        config.url = url
        config.timeout = timeout
        config.open_timeout = open_timeout
      end
    end
    subject { TRIPALERTZ::Deal.new()  }

    let(:valid_auth_login) { ENV['TRIPALERTZ_AUTH_LOGIN'] }
    let(:valid_auth_key) { ENV['TRIPALERTZ_AUTH_KEY'] }
    let(:valid_url) { ENV['TRIPALERTZ_URL'] }
    let(:valid_timeout) { ENV['TRIPALERTZ_TIMEOUT'] }
    let(:valid_open_timeout) { ENV['TRIPALERTZ_OPEN_TIMEOUT'] }

    let(:invalid_auth_login) { 'xyz' }
    let(:invalid_auth_key) { 'asdfasdfsadfsdaf' }
    let(:invalid_url) { 'http://www.invalidurl.com' }
    let(:invalid_timeout) {0}
    let(:invalid_open_timeout)  {0}


    context 'Initialize' do
      let(:auth_login) { invalid_auth_login  }
      let(:auth_key) { invalid_auth_key }
      let(:url) { valid_url }
      let(:timeout) { invalid_timeout }
      let(:open_timeout) { invalid_open_timeout }
      it 'should initialize' do
        subject.auth_login.should == invalid_auth_login
        subject.auth_login.should == invalid_auth_login
        subject.url.should == valid_url
        subject.timeout.should == invalid_timeout
        subject.open_timeout.should == invalid_open_timeout

      end
    end

    context 'current deals' do
      let(:auth_login) { valid_auth_login  }
      let(:auth_key) { valid_auth_key }
      let(:url) { valid_url }
      let(:timeout) { valid_timeout }
      let(:open_timeout) { valid_open_timeout }

      it 'should work' do
        subject.current
        subject.auth_login.should == valid_auth_login
        subject.auth_login.should == valid_auth_login
      end
    end
  end

end
