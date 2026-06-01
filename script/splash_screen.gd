extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("FADE IN OUT")
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://main_menu.tscn")
	
	#DialogueManager.call_deferred("_hide_on_scene_start")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
