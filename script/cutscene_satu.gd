extends CanvasLayer


const DIALOG_TEXTS = [
	"Kamu lihat pecahan fragment ini?",
	"Sudah ratusan tahun tidak ada yang bisa menyentuhnya tanpa… reaksi.",
	"Tapi hati-hati, beberapa orang yang menyentuhnya tidak sempat kembali.",
	"Pergilah. Dan dapatkan pecahan fragmen lainnya. Nusantara menantimu."
]

func _ready():
	DialogueManager.call_deferred("start_dialog", DIALOG_TEXTS, "Nusan: ")
