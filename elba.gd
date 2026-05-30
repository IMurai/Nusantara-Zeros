extends CharacterBody2D

@onready var sprite := $AnimatedSprite2D
var sudah_terhubung = false

const DIALOG_TEXTS = [
	"Anak muda dari mana kau berasal, aku tidak kenal baumu.",
	"Kami hidup dengan cara Nomaden, hidup dari apa yang ada. Berburu, mengumpulkan buah, ikuti sungai. \nTidak lebih, tidak kurang.",
	"Kau mau tahu lebih banyak tentang zaman kami? Buktikan dulu kau layak menyimpan pengetahuan ini.",
]

func _ready():
	sprite.play("idle")
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		DialogueManager.call_deferred("start_dialog", DIALOG_TEXTS, "Elba: ")
		sudah_terhubung = true
		#DialogueManager.dialog_selesai.connect(_on_dialog_selesai)
		DialogueManager.start_dialog(DIALOG_TEXTS, "Rohg")
		
	if not DialogueManager.dialog_selesai.is_connected(_on_dialog_selesai):
		DialogueManager.dialog_selesai.connect(_on_dialog_selesai)
	
func _on_dialog_selesai():
	DialogueManager.dialog_selesai.disconnect(_on_dialog_selesai)
	QuizManager.mulai_kuis()
