extends Control


@onready var credits_panel = $"Panel"  # SESUAIKAN path-nya

func _ready():
	Transition.color_rect.visible = true
	Transition.animation_player.play("fade_to_normal")
	credits_panel.visible = false

func _on_credits_pressed() -> void:
	credits_panel.visible = true

func _on_close_pressed() -> void:
	credits_panel.visible = false
