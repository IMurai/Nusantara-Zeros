extends CharacterBody2D

@onready var sprite := $AnimatedSprite2D

const DIALOG_TEXTS = [
	"Kau bukan dari sini. Pakaianmu aneh.",
	"Kami tidak tinggal lama di satu tempat. Kalau makanan habis, kami jalan lagi. Begitu terus.",
	"Kapak Perimbas itu itu jangan dipegang sembarangan. Kami memilih batu yang keras dan bisa dipecah tajam. 
	Tidak semua batu bisa jadi Kapak Perimbas."
]

func _ready():
	sprite.play("idle")
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		DialogueManager.start_dialog(DIALOG_TEXTS)
