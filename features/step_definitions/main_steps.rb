Then(/^I should see that "([^"]*)" tab is selected$/) do |tab|
  active_tab = @page.main_page.get_active_tab.capitalize
  fail "'#{active_tab}' is selected instead of '#{tab}'!" unless tab == active_tab
end

Then(/^I should see correct user name in the menu$/) do
  user_name = decode @fixture['user']['user_name']
  actual_user_name = @page.main_page.get_user_name
  fail 'Incorrect user name is displayed!' unless user_name == actual_user_name
end

When(/^I open user menu$/) do
  @page.main_page.open_user_menu
end

When(/^I select "([^"]*)" menu option$/) do |option|
  case option
    when 'Logout'
      @page.main_page.do_logout
    else
      fail 'Unsupported menu option!'
  end
end