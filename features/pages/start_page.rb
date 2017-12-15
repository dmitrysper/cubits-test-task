class StartPage < BasePage

  def page_trait
    { css: "a[href $= 'sign_in']" }
  end

  def open_login_page
    login_link.click
  end

  private

  #elements

  def login_link
    locator = { css: "a[href $= 'sign_in']" }
    find_by_locator locator
  end

end