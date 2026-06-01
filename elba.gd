extends CharacterBody2D

@onready var sprite := $AnimatedSprite2D
var sudah_terhubung = false

const DIALOG_TEXTS = [
	"Anak muda dari mana kau berasal, aku tidak kenal baumu.",
	"Kami hidup dengan cara Nomaden, hidup dari apa yang ada. Berburu, mengumpulkan buah, ikuti sungai. \nTidak lebih, tidak kurang.",
	"Sebentarr...",
	"Apakah kamu adalah orang yang ditugaskan untuk mencari fragment ini?",
	"Jika ya, buktikan apakah kamu layak untuk mendapatkannya."
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
