require 'capybara/rspec'

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium, using: :headless_chrome, options: {
      browser: :remote,
      url: 'http://selenium_chrome:4444/wd/hub',
      desired_capabilities: :chrome,
    }
    Capybara.server_host = 'web'
    Capybara.app_host = 'http://web'
  end
end
