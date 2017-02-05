class ScreenSelectSubCategory < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @rows = element(:id, 'category_name')
    @driver = driver
  end

  def visible?(title)
    @driver.wait { @driver.text(title).displayed? }
    @driver.wait do
      @driver.find_element(
        @rows[:type], @rows[:value]
      ).displayed?
    end
  end

def swipe(start_x, start_y, end_x, end_y)
  action = Appium::TouchAction.new.press(x: start_x, y: start_y).wait(500).
  move_to(x:end_x, y:end_y).wait(500).release(x: end_x, y: end_y)
  action.perform
end

  def select_sub_category(sub_name)
    @searching = true
    while @searching
      @driver.find_elements(
        @rows[:type], @rows[:value]
      ).each do |row|
        #print "\n" + row.text
        next unless row.text == sub_name && @driver.text(sub_name).displayed?
        row.click
        @searching = false
        break
      end
      swipe(0,0,0,100)
    end
  end
end
