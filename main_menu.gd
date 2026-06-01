extends Control


@onready var credits_panel = $"Panel"  # SESUAIKAN path-nya

func _ready():
	credits_panel.visible = false

func _on_credits_pressed() -> void:
	credits_panel.visible = true

func _on_close_pressed() -> void:
	credits_panel.visible = false
