Given(/^I am on the (Start) page$/) do |page|
  @base_url = @fixture['app_config']['base_url']
  @page = PageManager.new @driver
  case page
    when 'Start'
      @current_page = @page.start_page
    else
      p 'Unsupported starting page!'
      @current_page = @page.start_page
  end
  @driver.get @base_url
end