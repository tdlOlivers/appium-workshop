class ScreenFilterList < ScreenBase
  attr_accessor :driver
  def initialize(driver)

    @row_filter_background = element(:id, 'row_filter_background')

    @driver = driver
  end


def find_filter(sub_name)

  @driver.find_elements(
    @row_filter_background[:type], @row_filter_background[:value]
  ).each do |row|
    next unless row.find_element(:id,'row_filter_name').text == sub_name
    sleep 3
    row.click
    break
  end

end



end
