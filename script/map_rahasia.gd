extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Transition.color_rect.visible = true
	Transition.animation_player.play("fade_to_normal")
	
	DialogueManager.call_deferred("_hide_on_scene_start")
