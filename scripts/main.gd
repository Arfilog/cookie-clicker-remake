extends Control

func _on_cookie_button_button_down() -> void:
	Game.cookies += Game.amount_per_click

	Game.update_cookies.emit(Game.cookies)
	Game.cookie_clicked.emit(Game.amount_per_click)

	Game.save_data()
