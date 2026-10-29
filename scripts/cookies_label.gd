extends Label

func _ready() -> void:
	Game.update_cookies.connect(_on_game_update_cookies)

func _on_game_update_cookies(cookies) -> void:
	text = str(cookies) + " Cookies"
