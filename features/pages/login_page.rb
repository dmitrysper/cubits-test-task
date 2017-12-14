class LoginPage < BasePage

  def page_trait
    { css: "button[type='submit']" }
  end

  def enter_email(email)
    email_input.send_keys email
  end

  def enter_password(password)
    password_input.send_keys password
  end

  def do_login
    login_button.click
  end

  private

  #elements

  def email_input
    locator = { id: 'user_email' }
    find_by_locator locator
  end

  def password_input
    locator = { id: 'user_password' }
    find_by_locator locator
  end

  def login_button
    locator = { css: "button[type='submit']" }
    find_by_locator locator
  end

end