class PageManager < BasePage

  def start_page
    @start_page ||= StartPage.new(@web_driver)
  end

  def login_page
    @login_page ||= LoginPage.new(@web_driver)
  end

  def main_page
    @main_page ||= MainPage.new(@web_driver)
  end

end