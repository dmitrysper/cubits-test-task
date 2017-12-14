require 'selenium-webdriver'
require 'cucumber'

IMPLICIT_WAIT = 15

CHROME = 'chrome'
FIREFOX = 'firefox'

MACOS = 'darwin'
LINUX = 'linux'

Before do
  @driver = start_browser ENV['BROWSER'], ENV['DRIVER_PATH']
  @driver.manage.timeouts.implicit_wait = IMPLICIT_WAIT
  @driver.manage.window.maximize
end

After do
  @driver.quit
end

def start_browser(browser_name, driver_path = '')
  case browser_name
    when FIREFOX
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile.native_events = true
      Selenium::WebDriver.for browser_name.to_sym, profile: profile
    when CHROME
      full_driver_path = driver_path
      caps = Selenium::WebDriver::Remote::Capabilities.chrome
      case get_system_info
        when MACOS
          full_driver_path = driver_path + '/osx/chromedriver'
        when LINUX
          full_driver_path = driver_path + '/linux/chromedriver'
        else
          fail 'Unsupported platform!'
      end
      Selenium::WebDriver::Chrome.driver_path = full_driver_path
      Selenium::WebDriver.for browser_name.to_sym, desired_capabilities: caps
    else
      fail 'Browser is not supported!'
  end
end

def get_system_info
  RUBY_PLATFORM[/(?<=-)[a-z]+/]
end