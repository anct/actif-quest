module ApplicationHelper
  def admin_menu_item(name, path)
    link_to(name, path, class: "list-group-item")
  end

  def admin_action_btn(name, path, option = {})
    link_to(name, path, option.merge(class: "btn btn-primary"))
  end

  def admin_action_btn_sm(name, path, option = {})
    link_to(name, path, option.merge(class: "btn btn-primary btn-sm"))
  end
end
