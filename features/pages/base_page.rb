class BasePage

  SHORT_WAIT_DURATION = 5
  DEFAULT_WAIT_DURATION = 15

  attr_reader :web_driver, :wait

  def initialize(driver)
    @web_driver = driver
    @wait = Selenium::WebDriver::Wait.new(timeout: DEFAULT_WAIT_DURATION)
    @short_wait = Selenium::WebDriver::Wait.new(timeout: SHORT_WAIT_DURATION)
  end

  def get_page_title
    @web_driver.title
  end

  def get_current_url
    @web_driver.current_url
  end

  def get_element_text(element)
    element.text
  end

  def find_by_locator(locator_hash)
    locator = locator_hash.keys.first
    query = locator_hash.values.first
    @wait.until do
      element = @web_driver.find_element locator, query
      element if element.displayed?
    end
  end

  def find_all_by_locator(locator_hash)
    locator = locator_hash.keys.first
    query = locator_hash.values.first
    @wait.until do
      elements = @web_driver.find_elements locator, query
      elements if elements.all?(&:displayed?)
    end
  end

  def element_exist?(locator_hash)
    locator = locator_hash.keys.first
    query = locator_hash.values.first
    begin
      @short_wait.until { @web_driver.find_element locator, query }
    rescue Selenium::WebDriver::Error::TimeOutError
      false
    else
      true
    end
  end

  def on_page?
    locator = page_trait.keys.first
    query = page_trait.values.first
    begin
      @wait.until { @web_driver.find_element locator, query }
    rescue Selenium::WebDriver::Error::TimeOutError
      false
    else
      true
    end
  end

  def go_forward
    @web_driver.navigate.forward
  end

  def go_back
    @web_driver.navigate.back
  end

  def refresh_page
    @web_driver.navigate.refresh
  end
  
  # elements

end