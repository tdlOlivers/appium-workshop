class ScreenSetFilterParameters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @parameter_holders = element(:id, 'parameter_body_holder')
    @filter_name = element(:id, 'param_filter_name')
    @button_save = element(:id, 'save_filter')
    @driver = driver

  end

  def visible?
    @driver.wait do
      @driver.find_element(
        @parameter_holders[:type], @parameter_holders[:value]
      ).displayed?
    end
  end

  def hide_keyboard_and_wait(time)
    @driver.hide_keyboard
    sleep time
  end

  def set_name(text_name)
    @driver.wait{@driver.find_element(@filter_name[:type], @filter_name[:value]).displayed?}
    sleep 3
    @driver.find_element(
      @filter_name[:type], @filter_name[:value]
    ).send_keys(text_name)
    hide_keyboard_and_wait(3)
  end


  def add_values(sub_name,first_value,second_value)
    @driver.find_elements(
      @parameter_holders[:type], @parameter_holders[:value]
    ).each do |row|
      next unless row.find_element(:id,'parameter_name').text == sub_name
      sleep 3
      row.find_element(:id,'left_param').send_keys(first_value)
      row.find_element(:id,'right_param').send_keys(second_value)
      break
    end
    hide_keyboard_and_wait(3)
  end

  def save_filter
    @driver.find_element(
      @button_save[:type], @button_save[:value]
    ).click
  end


end
