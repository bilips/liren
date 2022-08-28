extends Area

# 要显示的UI TAB
export(int) var show_ui_tab = 0

func _on_InteractiveArea_body_entered(body):
	if body.name == "Teacher":
		GlobalUi.show_ui_tab(show_ui_tab)
