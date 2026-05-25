extends CharacterBody2D

@onready var sprite := $AnimatedSprite2D

	
const DIALOG_TEXTS = [
	"Kau sudah kembali. Aku tahu kau pasti bisa.",
	"Sekarang fragment ini pun kembali menjadi utuh.",
	"Nusantara tidak dimulai dari kerajaan besar yang ada di buku sejarahmu.",
	 "Ia dimulai dari batu yang dipecah kasar untuk dijadikan senjata.",
]

func _ready():
	sprite.play("idle")
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		DialogueManager.call_deferred("start_dialog", DIALOG_TEXTS, "Nusan: ")
		DialogueManager.dialog_finished.connect(_on_dialog_finished)

func _on_dialog_finished():
	DialogueManager.dialog_finished.disconnect(_on_dialog_finished)
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://main_menu.tscn")
