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

  def admin_destroy_btn(path, option = {})
    link_to('<i class="fa fa-trash-o"></i> Destroy'.html_safe, path, option.merge(class: "btn btn-danger", method: :delete, data: { confirm: 'Are you sure?' }))
  end

  def admin_edit_btn(path, option = {})
    link_to('<i class="fa fa-pencil"></i> Edit'.html_safe, path, option.merge(class: "btn btn-primary"))
  end

  def admin_new_btn(path, option = {})
    link_to('<i class="fa fa-check"></i> New Beacon'.html_safe, path, option.merge(class: "btn btn-warning"))
  end
end
