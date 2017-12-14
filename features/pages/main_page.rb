class MainPage < BasePage

  def page_trait
    { css: '.hprofile__name' }
  end

  def get_active_tab
    get_element_text(active_tab)
  end
  
  def get_user_name
    get_element_text(user_name_div)
  end

  def open_user_menu
    arrow_down.click
  end

  def do_logout
    @web_driver.action.move_to(logout_link).click.perform
  end

  private

  #elements

  def user_name_div
    locator = { css: '.hprofile__name' }
    find_by_locator locator
  end

  def active_tab
    locator = { css: 'a.is-active>span' }
    find_by_locator locator
  end

  def arrow_down
    locator = { css: '.icon-arrowdown' }
    find_by_locator locator
  end

  def logout_link
    locator = { id: 'logout_link' }
    find_by_locator locator
  end

end