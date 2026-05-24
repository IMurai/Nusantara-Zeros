extends CanvasLayer

var soal_list = [
	{
		"pertanyaan": "Alat yang dipakai orang zaman Paleolitikum adalah...",
		"pilihan": ["Beliung Persegi", "Kapak Perimbas", "AK37", "Kapak Lonjong"],
		"benar": 1
	},
	{
		"pertanyaan": "Cara hidup manusia pada zaman Paleolitikum adalah...",
		"pilihan": ["Sedenter", "Agraris", "Nomaden", "Maritim"],
		"benar": 2
	},
	{
		"pertanyaan": "Alat batu Paleolitikum dibuat dengan cara...",
		"pilihan": [
			"Diasah halus",
			"Dicetak dari tanah liat",
			"Dipecah kasar tanpa diasah",
			"Dilebur dengan api"
		],
		"benar": 2
	}
]

var index_soal = 0
var skor = 0

@onready var label_soal  = $KotakKuis/Soal
@onready var tombol_a    = $KotakKuis/TombolA
@onready var tombol_b    = $KotakKuis/TombolB
@onready var tombol_c    = $KotakKuis/TombolC
@onready var tombol_d    = $KotakKuis/TombolD
@onready var hasil_label = $HasilLabel

func mulai_kuis():
	index_soal = 0
	skor = 0
	show()
	tampilkan_soal()

func tampilkan_soal():
	hasil_label.text = ""
	var data = soal_list[index_soal]
	label_soal.text = data["pertanyaan"]
	tombol_a.text = "A.  " + data["pilihan"][0]
	tombol_b.text = "B.  " + data["pilihan"][1]
	tombol_c.text = "C.  " + data["pilihan"][2]
	tombol_d.text = "D.  " + data["pilihan"][3]

	for t in [tombol_a, tombol_b, tombol_c, tombol_d]:
		t.disabled = false

func _on_tombol_a_pressed(): cek_jawaban(0)
func _on_tombol_b_pressed(): cek_jawaban(1)
func _on_tombol_c_pressed(): cek_jawaban(2)
func _on_tombol_d_pressed(): cek_jawaban(3)

func cek_jawaban(pilihan: int):
	for t in [tombol_a, tombol_b, tombol_c, tombol_d]:
		t.disabled = true

	if pilihan == soal_list[index_soal]["benar"]:
		skor += 1
		hasil_label.text = "✓  Benar!"
	else:
		var jawaban_benar = soal_list[index_soal]["pilihan"][soal_list[index_soal]["benar"]]
		hasil_label.text = "✗  Salah! Jawaban: " + jawaban_benar

	await get_tree().create_timer(1.5).timeout
	lanjut_soal()

func lanjut_soal():
	index_soal += 1

	if index_soal < soal_list.size():
		tampilkan_soal()
	else:
		selesai()

func selesai():
	if skor >= 2:
		hasil_label.text = "Skor: %d/3 — Lulus! Melanjutkan..." % skor
		await get_tree().create_timer(2.0).timeout
		hide()
		get_tree().change_scene_to_file("res://map_paleolitikum.tscn")
	else:
		hasil_label.text = "Skor: %d/3 — Belum lulus. Coba lagi!" % skor
		await get_tree().create_timer(2.0).timeout
		mulai_kuis()
