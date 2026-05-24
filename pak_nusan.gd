extends CharacterBody2D

@onready var sprite := $AnimatedSprite2D

	
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
		DialogueManager.start_dialog(DIALOG_TEXTS)
