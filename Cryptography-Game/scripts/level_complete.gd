extends Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalTimer._stop_timer();
	Global._winState = true;
	
	$AnimationPlayer.play("open-window")
	GlobalSounds.success.play()
	$Time.text = "Time: " + GlobalTimer._time_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_codex_btn_pressed() -> void:
	GlobalSounds.select.play()
	if(Global.menuOpen):
		pass
	else:
		var codex = preload("res://scenes/codex.tscn").instantiate()
		get_tree().get_root().add_child(codex)


func _on_level_select_btn_pressed() -> void:
	GlobalSounds.select.play()
	if Global.menuOpen:
		pass
	else:
		var levelSelect = load("res://scenes/level-select-menu.tscn").instantiate()
		get_tree().get_root().add_child(levelSelect)


func _on_codex_btn_mouse_entered() -> void:
	GlobalSounds.hover.play()


func _on_level_select_btn_mouse_entered() -> void:
	GlobalSounds.hover.play()
