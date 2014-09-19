module ApplicationHelper
	def admin_menu_item(name, path)
		link_to(name, path, class: "list-group-item")
	end
end
