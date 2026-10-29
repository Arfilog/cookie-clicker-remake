extends Node

var save_path = "user://userdata.save"

var cookies := 0
var amount_per_click := 1
var upgrade1 := false
var upgrade2 := false
var upgrade3 := false
var upgrade4 := false
var reset_button := false

signal update_cookies(cookies: int)
signal cookie_clicked(amount: int)

func _ready():
	load_data()
	await get_tree().create_timer(0.2).timeout
	emit_signal("update_cookies", cookies)

func save_data():
	var data = {
		"cookies": cookies,
		"amount_per_click": amount_per_click,
		"upgrade1": upgrade1,
		"upgrade2": upgrade2,
		"upgrade3": upgrade3,
		"upgrade4": upgrade4,
		"reset_button": reset_button,
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
			update_data(data)
		else:
			save_data()

func update_data(data):
	cookies = data.get("cookies", 0)
	amount_per_click = data.get("amount_per_click", 1)
	upgrade1 = data.get("upgrade1", false)
	upgrade2 = data.get("upgrade2", false)
	upgrade3 = data.get("upgrade3", false)
	upgrade4 = data.get("upgrade4", false)
	reset_button = data.get("reset_button", false)

func reset_data():
	cookies = 0
	amount_per_click = 1
	upgrade1 = false
	upgrade2 = false
	upgrade3 = false
	upgrade4 = false
	reset_button = false
	save_data()
	emit_signal("update_cookies", cookies)
