module ApplicationHelper
  def admin_menu_item(name, path)
    link_to(name, path, class: "list-group-item")
  end

  def admin_back_btn(path, option = {})
    link_to(fa_icon("arrow-left", text: 'Back'), path, option.merge(class: "btn btn-primary"))
  end

  def admin_edit_btn(path, option = {})
    link_to(fa_icon("pencil", text: 'Edit'), path, option.merge(class: "btn btn-primary"))
  end

  def admin_edit_btn_sm(path, option = {})
    link_to(fa_icon("pencil", text: 'Edit'), path, option.merge(class: "btn btn-primary btn-sm"))
  end

  def admin_destroy_btn(path, option = {})
    link_to(fa_icon("trash-o", text: 'Destroy'), path, option.merge(class: "btn btn-danger", method: :delete, data: { confirm: 'Are you sure?' }))
  end

  def admin_destroy_btn_sm(path, option = {})
    link_to(fa_icon("trash-o", text: 'Destroy'), path, option.merge(class: "btn btn-danger btn-sm", method: :delete, data: { confirm: 'Are you sure?' }))
  end

  def admin_new_btn(path, option = {})
    link_to(fa_icon("check", text: 'New Beacon'), path, option.merge(class: "btn btn-warning"))
  end

  def admin_update_btn
    content_tag(:button, fa_icon("refresh", text: 'Update'), class: "btn btn-primary")
  end
     
  def admin_show_btn(path, option = {})
    link_to(fa_icon("list-ul", text: 'Show'), path, option.merge(class: "btn btn-primary"))
  end

  def admin_submit_btn
    content_tag(:button, fa_icon("paper-plane-o", text: 'Submit'), class: "btn btn-primary")
  end
end
