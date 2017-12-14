When(/^I enter (valid|invalid) e-mail address$/) do |email_type|
  email = decode @fixture['user'][email_type]['email']
  @page.login_page.enter_email(email)
end

When(/^I enter (valid|invalid) password$/) do |password_type|
  password = decode @fixture['user'][password_type]['password']
  @page.login_page.enter_password(password)
end