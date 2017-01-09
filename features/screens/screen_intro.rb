class ScreenIntro < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    #elements
    #ID is used because ID is unique
    @base = element(:id, 'content')
    #ID for 'OK' button was not available, therefore element was found using class
    @OK = element(:class, 'android.widget.Button')
    @closeIntro = element(:id, 'close_intro')
    @introFooterImage = element(:id, 'intro_footer_image')
    @pageImage = element(:id, 'page_image')
    @introTextHeader = element(:id, 'intro_text_header')
    @introTextFooter = element(:id, 'intro_text_footer')
    #drivers
    @driver = driver
  end

  def visible?
    @driver.find_element(@base[:type], @base[:value])
    @driver.find_element(@OK[:type], @OK[:value]).click();
    @driver.find_element(@closeIntro[:type], @closeIntro[:value])
    @driver.find_element(@introFooterImage[:type], @introFooterImage[:value])
    @driver.find_element(@pageImage[:type], @pageImage[:value])
    @driver.find_element(@introTextHeader[:type], @introTextHeader[:value])
    @driver.find_element(@introTextFooter[:type], @introTextFooter[:value])
  end
end
