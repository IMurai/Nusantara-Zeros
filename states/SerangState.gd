extends State

const ARAH_MAP = {
	"ui_right": {"vec": Vector2.RIGHT},
	"ui_left":  {"vec": Vector2.LEFT},
	"ui_up":    {"vec": Vector2.UP},
	"ui_down":  {"vec": Vector2.DOWN}
}

func enter():
	var animasi = player.get_animasi()
	# cek apakah ada input arah saat ini
	var arah_sekarang = get_arah_sekarang()	
	if arah_sekarang != Vector2.ZERO:
		player.arah_terkahir = arah_sekarang
	
	# mulai animasi berdasarkan arah

func get_arah_sekarang():
	# cek input arah yang sedang ditekan
	for action in ARAH_MAP.keys():
		if Input.is_action_pressed(action):
			return ARAH_MAP[action]["vec"]
	return Vector2.ZERO
