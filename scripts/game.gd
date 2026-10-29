extends Control

var save_path = "user://userdata.save"

var cookies = 0
var amount_per_click = 1

signal update_cookies
signal cookie_clicked

func _ready():
	load_data()
	emit_signal("update_cookies", cookies)

func save_data():
	var data = {
		"cookies": cookies,
		"amount_per_click": amount_per_click,
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
			amount_per_click = data.get("amount_per_click", 1)
			update_data(data)
		else:
			save_data()

func update_data(data):
	for key in data.keys():
		print(key + ": " + str(data[key]))

func _on_cookie_button_button_down() -> void:
	cookies += amount_per_click
	emit_signal("update_cookies", cookies)
	emit_signal("cookie_clicked", amount_per_click)
	save_data()
