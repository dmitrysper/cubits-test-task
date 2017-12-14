When(/^I click "([^"]*)" button$/) do |button_name|
  case button_name
    when 'Login'
      @page.login_page.do_login
    else
      fail 'Unknown button name!'
  end
end

When(/^I click "([^"]*)" browser button$/) do |browser_button|
  case browser_button
    when 'Forward'
      @current_page.go_forward
    when 'Back'
      @current_page.go_back
    when 'Refresh'
      @current_page.refresh_page
    else
      fail 'Unsupported browser button!'
  end
end

When(/^I click on "([^"]*)" link$/) do |link|
  case link
    when 'Login'
      @page.start_page.open_login_page
    else
      fail 'Unknown link'
  end
end

Then(/^I should see "([^"]*)" page$/) do |page|
  page_opened = false
  case page
    when 'Start'
      page_opened = @page.start_page.on_page?
      @current_page = @page.start_page
    when 'Login'
      page_opened = @page.login_page.on_page?
      @current_page = @page.login_page
    when 'Main'
      page_opened = @page.main_page.on_page?
      @current_page = @page.main_page
    else
      fail "Unknown page - << #{page} >> !"
  end
  fail "Page '#{page}' is not opened!" unless page_opened
end