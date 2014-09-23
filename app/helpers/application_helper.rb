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
    link_to(fa_icon("trash-o", text: 'Destroy'), path, option.merge(class: "btn btn-danger", method: :delete, data: { confirm: 'Are you sure?' }))
  end

  def admin_edit_btn(path, option = {})
    link_to(fa_icon("pencil", text: 'Edit'), path, option.merge(class: "btn btn-primary"))
  end

  def admin_new_btn(path, option = {})
    link_to(fa_icon("check", text: 'New Beacon'), path, option.merge(class: "btn btn-warning"))
  end

  def admin_submit_btn
    content_tag(:button, fa_icon("paper-plane-o", text: 'Submit'), class: "btn btn-primary")
  end
end
