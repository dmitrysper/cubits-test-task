When(/^I click "([^"]*)" button$/) do |button_name|
  case button_name
    when 'Login'
      @page.login_page.do_login
    else
      fail 'Unknown button name!'
  end
end

Then(/^I should not see any note in the TODO list$/) do
  fail 'TODO notes list is displayed!' if @page.react_todo_page.notes_list_exists?
end

Then(/^I should see (\d+) notes? in TODO list$/) do |number_of_notes|
  actual_number_of_notes = @page.react_todo_page.get_number_of_notes
  fail "Incorrect number of notes in TODO list - #{actual_number_of_notes} instead of - #{number_of_notes}" unless actual_number_of_notes == number_of_notes.to_i
end

Then(/^I should see correct text in the TODO note number (\d)$/) do |note_number|
  actual_note_text = @page.react_todo_page.get_note_text_by_number note_number.to_i
  fail "Incorrect text in the TODO note - #{actual_note_text} instead of - #{@new_todo_note}" unless actual_note_text == @new_todo_note
end

Then(/^I should see that there i?s?a?r?e? (\d+) items? left$/) do |number_of_items|
  actual_number_of_items = @page.react_todo_page.get_number_of_items_left
  fail "Incorrect numbers of items left is displayed - #{actual_number_of_items} instead of - #{number_of_items}" unless actual_number_of_items == number_of_items.to_i
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