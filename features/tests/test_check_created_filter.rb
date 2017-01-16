class TestCheckCreatedFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  def select_filter
    @screens.screen_filter_list.find_filter('Filter 1')
  end


def check_values
   @screens.screen_filter_attributes.check_values('CENA (EUR)','1','1000')
   @screens.screen_filter_attributes.check_values('PLATĪBA (M2)','1','3000')
end


  def check_created_filter
    select_filter
    check_values
  end



end
