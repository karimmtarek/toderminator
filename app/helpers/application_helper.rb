module ApplicationHelper
  # http://stackoverflow.com/questions/13465477/how-to-add-current-high-voltage-page-name-as-a-body-class
  def body_class
    "#{controller_name} #{controller_name}-#{controller.action_name}"
  end

  def controller_name
    controller.controller_path.gsub('/','-')
  end

  def page_id
    params['id']
  end

  def active_class
    controller_name == "lists" ? "active" : ""
  end

  def list_name
    truncate(@list.name, length: 140)
  end
end
