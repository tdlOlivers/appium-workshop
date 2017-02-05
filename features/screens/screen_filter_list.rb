require "test/unit/assertions"
include Test::Unit::Assertions

class ScreenFilterList < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @row_filter_background = element(:id, 'row_filter_background')
    @menu_button = element(:class, 'android.widget.ImageButton')
    @menu_items = element(:id, 'com.testdevlab.notifyus:id/item_name')
    @driver = driver
  end

  def click_menu_item(name)
    @driver.wait{@driver.find_element(@menu_items[:type], @menu_items[:value]).displayed?}
    @driver.find_elements(
      @menu_items[:type], @menu_items[:value]
    ).each do |row|
      next unless row.text == name
      row.click
     break
    end
  end

def find_filter(sub_name)
  @driver.wait{@driver.find_element(@row_filter_background[:type], @row_filter_background[:value]).displayed?}
  @found = false
  @driver.find_elements(
    @row_filter_background[:type], @row_filter_background[:value]
  ).each do |row|
    next unless row.find_element(:id,'row_filter_name').text == sub_name
    @found = true
   break
  end

  if @found
    print "\nFound " + sub_name +"\n"
  else
    assert(false,"\nDid not find " + sub_name + "\n")
  end
end

def click_main_menu_button
  @driver.wait{@driver.find_element(@menu_button[:type], @menu_button[:value]).displayed?}
  @driver.find_element(@menu_button[:type], @menu_button[:value]).click
end

def return_to_main_menu
  click_main_menu_button
  click_menu_item('Izveidot filtru')
end

end
