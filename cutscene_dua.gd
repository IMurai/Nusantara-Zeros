extends Node2D

const DIALOG_TEXTS = [
	"Tara pun mendapatkan pecahan fragment yang ia cari",
	"Ai pun kembali tersedot ke lorong waktu 
	\ndan kembali ke tempat misterius di dalm museum",
]

func _ready() -> void:
	Transition.color_rect.visible = true
	Transition.animation_player.play("fade_to_normal")
	await get_tree().process_frame
	DialogueManager.dialog_finished.connect(_on_dialog_finished)
	await get_tree().create_timer(2.0).timeout
	DialogueManager.start_dialog(DIALOG_TEXTS, "Narasi: ")

func _on_dialog_finished():
	DialogueManager.dialog_finished.disconnect(_on_dialog_finished)
	get_tree().change_scene_to_file("res://map_museum.tscn")
