extends Panel

func _ready() -> void:
	update_buttons()

func _on_upgrade_1_button_down() -> void:
	const needed = 50
	if Game.cookies >= needed:
		
		Game.amount_per_click += 1
		Game.cookies -= needed
		Game.upgrade1 = true

		Game.emit_signal("update_cookies", Game.cookies)
		reset_button_check()
		Game.save_data()
		update_buttons()

func _on_upgrade_2_button_down() -> void:
	const needed = 200
	if(Game.cookies >= needed):
		
		Game.amount_per_click += 1
		Game.cookies -= needed
		Game.upgrade2 = true
		
		Game.emit_signal("update_cookies", Game.cookies)
		reset_button_check()
		Game.save_data()
		update_buttons()


func _on_upgrade_3_button_down() -> void:
	const needed = 500
	if(Game.cookies >= needed):
		
		Game.amount_per_click += 2
		Game.cookies -= needed
		Game.upgrade3 = true
		
		Game.emit_signal("update_cookies", Game.cookies)
		reset_button_check()
		Game.save_data()
		update_buttons()

func _on_upgrade_4_button_down() -> void:
	const needed = 1000
	if(Game.cookies >= needed):
		
		Game.amount_per_click += 5
		Game.cookies -= needed
		Game.upgrade4 = true
		
		Game.emit_signal("update_cookies", Game.cookies)
		reset_button_check()
		Game.save_data()
		update_buttons()

func _on_reset_data_button_down() -> void:
	Game.reset_data()
	update_buttons()

func reset_button_check() -> void:
	if(Game.upgrade1 and Game.upgrade2 and Game.upgrade3 and Game.upgrade4):
		Game.reset_button = true
		update_buttons()

func update_buttons():
	$VBoxContainer/Upgrade1.visible = not Game.upgrade1
	$VBoxContainer/Upgrade2.visible = not Game.upgrade2
	$VBoxContainer/Upgrade3.visible = not Game.upgrade3
	$VBoxContainer/Upgrade4.visible = not Game.upgrade4
	$VBoxContainer/ResetData.visible = Game.reset_button
