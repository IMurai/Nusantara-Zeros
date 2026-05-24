extends CanvasLayer

const DIALOG_TEXTS = [
	"Tara, siswa SMA kelas 10, mendapat tugas dari guru sejarahnya.",
	"Mengunjungi Museum Sangiran dan mempelajari kehidupan manusia 
	\nzaman praaksara terutama  zaman paleozoikum secara langsung.",
	"Dengan malas, Raka berangkat sendirian pagi itu..."
]

func _ready() -> void:
	await get_tree().process_frame
	DialogueManager.call_deferred("start_dialog", DIALOG_TEXTS, "Nusan: ")
	get_tree().change_scene_to_file("res://map_museum.tscn")
	
