extends Node

@onready var fx_player: AudioStreamPlayer = $FxAudioPlayer
@onready var music_player: AudioStreamPlayer = $MusicAudioPlayer

func _ready() -> void:
	AudioPlayer.on_play_sound.connect(_on_play_sound)


func _on_play_sound(category: String, sound: AudioStream) -> void:
	match category.to_lower():
		"fx":
			fx_player.stop()
			fx_player.stream = sound
			fx_player.play()
		"music":
			music_player.stop()
			music_player.stream = sound
			music_player.play()


func _unhandled_input(event: InputEvent) -> void: # TODO Remove this temp code once audio is being triggered elsewhere
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_H:
			AudioPlayer.play("fx", "something")
		if event.pressed and event.keycode == KEY_J:
			AudioPlayer.play("music", "random")
		if event.pressed and event.keycode == KEY_K:
			AudioPlayer.play("fx", "random")
