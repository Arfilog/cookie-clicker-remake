extends Control

var save_path = "user://userdata.save"

var cookies = 0
var cookies_per_click = 1

signal update_cookies

func _ready():
	load_data()
	emit_signal("update_cookies", cookies)

func save_data():
	var data = {
		"cookies": cookies,
	}
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(data)
	file.close()

func load_data():
	if(FileAccess.file_exists(save_path)):
		var file = FileAccess.open(save_path, FileAccess.READ)
		var data = file.get_var()
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			cookies = data.get("cookies", 0)
		else:
			save_data()

func _on_cookie_button_button_down() -> void:
	cookies += cookies_per_click
	emit_signal("update_cookies", cookies)
	save_data()
