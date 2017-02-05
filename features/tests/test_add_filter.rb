require_relative '../config/filters'
class TestAddFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  def select_category
    @screens.screen_create_filter.visible?
    @screens.screen_create_filter.select_row(@filter_data.category)
  end

  def select_sub_category(sub_cat_hash)
    @screens.screen_select_sub_category.visible?(sub_cat_hash['title'])
    @screens.screen_select_sub_category.select_sub_category(
      sub_cat_hash['option']
    )
  end

  def open_filter_parameter_screen
    select_category
    if @filter_data.sub_categories == nil
    end
    @filter_data.sub_categories.each do |sub_category|
      select_sub_category(sub_category)
    end
  end

  def set_filter_name
    @screens.screen_set_filter_parameters.set_name(@filter_data.name)
  end

  def set_all_parameters
    if @filter_data.parameters == []
    else
      @screens.screen_set_filter_parameters.visible?
      @filter_data.parameters.each do |parameter|
        @screens.screen_set_filter_parameters.set_parameter(parameter)
      end
    end
  end

    def submit_filter_data
      set_filter_name
      set_all_parameters
      @screens.screen_set_filter_parameters.save_filter
    end

  def submit_empty_filter_parameters
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.save_filter
  end

  def check_created_filter
    @screens.screen_filter_list.find_filter(@filter_data.name)
  end

  def return_to_main_menu
    @screens.screen_filter_list.return_to_main_menu
  end

  def create_filter(name)
    @filter_data = Filter.new(name)
    open_filter_parameter_screen
    submit_filter_data
    check_created_filter
  end
end
