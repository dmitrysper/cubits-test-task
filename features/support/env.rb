require 'selenium-webdriver'
require 'cucumber'

IMPLICIT_WAIT = 15

CHROME = 'chrome'
FIREFOX = 'firefox'

CHROMEDRIVER = 'chromedriver'
GECKODRIVER = 'geckodriver'

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
  full_driver_path = driver_path
  driver_name = browser_name == CHROME ? CHROMEDRIVER : GECKODRIVER
  case get_system_info
    when MACOS
      full_driver_path = "#{driver_path}/osx/#{driver_name}"
    when LINUX
      full_driver_path = "#{driver_path}/linux/#{driver_name}"
    else
      fail 'Unsupported platform!'
  end
  case browser_name
    when FIREFOX
      caps = Selenium::WebDriver::Remote::Capabilities.firefox
      Selenium::WebDriver::Firefox.driver_path = full_driver_path
      Selenium::WebDriver.for browser_name.to_sym, desired_capabilities: caps
    when CHROME
      caps = Selenium::WebDriver::Remote::Capabilities.chrome
      Selenium::WebDriver::Chrome.driver_path = full_driver_path
      Selenium::WebDriver.for browser_name.to_sym, desired_capabilities: caps
    else
      fail 'Browser is not supported!'
  end
end

def get_system_info
  RUBY_PLATFORM[/(?<=-)[a-z]+/]
end