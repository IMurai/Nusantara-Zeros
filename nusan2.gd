extends CharacterBody2D

@onready var sprite := $AnimatedSprite2D

	
const DIALOG_TEXTS = [
	"Kau sudah kembali. Aku tahu kau pasti bisa.",
	"Prasasti itu sudah lama menunggu seseorang yang mau benar-benar belajar \nbukan sekadar menghapal.",
	"Nusantara tidak dimulai dari kerajaan besar yang ada di buku sejarahmu.",
	 "Ia dimulai dari batu yang dipecah kasar untuk dijadikan senjata",
	"Pergilah. Dan dapatkan pecahan fragmen lainnya. Nusantara menantimu."
]

func _ready():
	sprite.play("idle")
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		DialogueManager.call_deferred("start_dialog", DIALOG_TEXTS, "Nusan: ")
		#get_tree().change_scene_to_file("res://map_paleolitikum.tscn")
