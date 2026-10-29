extends MarginContainer

@onready var cookie_button: TextureButton = $CenterContainer/CookieButton

func _ready() -> void:
	cookie_button.pivot_offset = cookie_button.size / 2

func _on_cookie_button_button_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(cookie_button, "scale", Vector2(.9, .9), 0.1)

func _on_cookie_button_button_up() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(cookie_button, "scale", Vector2(1, 1), 0.1)
