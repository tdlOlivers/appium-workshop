class ScreenFilterAttributes < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @parameter_holders = element(:id, 'parameter_body_holder')
    @filter_name = element(:id, 'param_filter_name')
    @button_save = element(:id, 'save_filter')
    @driver = driver
  end

  def check_values(sub_name,first_value,second_value)

    @driver.find_elements(
      @parameter_holders[:type], @parameter_holders[:value]
    ).each do |row|
      next unless row.find_element(:id,'parameter_name').text == sub_name && row.find_element(:id,'left_param').text == first_value && row.find_element(:id,'right_param').text == second_value
      
      break
    end
  end


  end
