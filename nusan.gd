extends CharacterBody2D

@onready var sprite := $AnimatedSprite2D
var sudah_terhubung = false

	
const DIALOG_TEXTS = [
	"Kamu lihat pecahan fragment ini?",
	"Sudah ratusan tahun tidak ada yang bisa menyentuhnya tanpa… reaksi.",
	"Tapi hati-hati, beberapa orang yang menyentuhnya tidak sempat kembali.",
	"Pergilah. Dan dapatkan pecahan fragmen lainnya. Nusantara menantimu."
]

func _ready():
	sprite.play("idle")
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		DialogueManager.call_deferred("start_dialog", DIALOG_TEXTS, "Nusan: ")
		sudah_terhubung = true
		DialogueManager.dialog_selesai.connect(_on_dialog_selesai)
		DialogueManager.start_dialog(DIALOG_TEXTS, "Nusan:")
		
	if not DialogueManager.dialog_selesai.is_connected(_on_dialog_selesai):
		DialogueManager.dialog_selesai.connect(_on_dialog_selesai)
	
func _on_dialog_selesai():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().call_deferred("change_scene_to_file", "res://map_paleolitikum.tscn")
