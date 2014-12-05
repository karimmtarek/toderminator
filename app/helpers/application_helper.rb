module ApplicationHelper
  # controller_name - it's a device helper
  def body_class
    "#{controller_name} #{controller_name}-#{controller.action_name}"
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
