extends CanvasLayer

const CHAR_READ_RATE = 0.05

var textbox_container
var label
var start_symbol

enum State { READY, READING, FINISHED }

var current_state = State.READY
var text_queue = []
var is_active = false  # ← tambah ini

func _ready():
	await get_tree().process_frame
	var scene_root = get_tree().current_scene
	textbox_container = scene_root.find_child("Textboxcontainer", true, false)
	label = scene_root.find_child("IsiDialog", true, false)
	start_symbol = scene_root.find_child("Start", true, false)
	hide_textbox()

func start_dialog(texts: Array):
	if is_active:
		return
	is_active = true
	text_queue.clear()
	for t in texts:
		queue_text(t)
	current_state = State.READY

func _process(_delta):
	if !is_active:  # ← skip kalau dialog tidak aktif
		return
	match current_state:
		State.READY:
			if !text_queue.is_empty():
				display_text()
		State.READING:
			if Input.is_action_just_pressed("ui_accept"):
				label.visible_ratio = 1.0
				change_state(State.FINISHED)
		State.FINISHED:
			if Input.is_action_just_pressed("ui_accept"):
				if text_queue.is_empty():
					hide_textbox()
					is_active = false
				else:
					change_state(State.READY)
					
func queue_text(next_text):
	text_queue.push_back(next_text)

func hide_textbox():
	if label: label.text = ""
	if textbox_container: textbox_container.hide()
	if start_symbol: start_symbol.text = ""

func show_textbox():
	if textbox_container: textbox_container.show()
	if start_symbol: start_symbol.text = "Nusan: "

func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.visible_ratio = 0.0
	change_state(State.READING)
	show_textbox()
	var tween = create_tween()
	tween.tween_property(label, "visible_ratio", 1.0, len(next_text) * CHAR_READ_RATE)
	tween.finished.connect(func(): change_state(State.FINISHED))

func change_state(next_state):
	current_state = next_state
