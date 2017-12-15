When(/^I enter (valid|invalid|blank) e-mail address$/) do |email_type|
  email = @fixture['user'][email_type]['email']
  email = decode(email) if email_type == 'valid'
  @page.login_page.enter_email(email)
end

When(/^I enter (valid|invalid|blank) password$/) do |password_type|
  password = @fixture['user'][password_type]['password']
  password = decode(password) if password_type == 'valid'
  @page.login_page.enter_password(password)
end

Then(/^I should see "([^"]*)" error$/) do |error|
  error_message = @page.login_page.get_alert_text
  fail 'Error is not shown or incorrect!' unless error_message == error
end