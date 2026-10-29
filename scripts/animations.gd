extends MarginContainer

@onready var cookie_button: TextureButton = $CenterContainer/CookieButton
@onready var indicators: Control = $"../../Indicators"
@onready var template: Label = $"../../Indicators/Template"

func _ready() -> void:
	Game.cookie_clicked.connect(_on_game_cookie_clicked)
	cookie_button.pivot_offset = cookie_button.size / 2

func _on_cookie_button_button_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(cookie_button, "scale", Vector2(.9, .9), 0.1)

func _on_cookie_button_button_up() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(cookie_button, "scale", Vector2(1, 1), 0.1)

func _on_game_cookie_clicked(amount) -> void:
	var indicator = template.duplicate()
	indicator.text = "+" + str(amount)
	indicator.position = get_global_mouse_position()
	indicator.visible = true
	indicators.add_child(indicator)
	indicator.get_child(0).start()
	var tween = get_tree().create_tween()
	tween.tween_property(indicator, "modulate:a", 0.0, 0.99)
