extends CharacterBody2D

@onready var sprite := $AnimatedSprite2D

const DIALOG_TEXTS = [
	"Anak muda dari mana kau berasal, aku tidak kenal baumu.",
	"Kami hidup dari apa yang ada, berburu, mengumpulkan buah, ikuti sungai. Tidak lebih, tidak kurang.",
	"Kau mau tahu lebih banyak tentang zaman kami? Buktikan dulu kau layak menyimpan pengetahuan ini.",
]

func _ready():
	sprite.play("idle")
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		DialogueManager.call_deferred("start_dialog", DIALOG_TEXTS, "Elba: ")
