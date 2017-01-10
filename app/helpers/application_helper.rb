# location for helpers for whole application
module ApplicationHelper
  def tab_status(tab_name)
    status = flash['tab_name']

    return 'is-active' if tab_name.blank? && status.nil?
    return 'is-active' if tab_name == status
    ''
  end
end
