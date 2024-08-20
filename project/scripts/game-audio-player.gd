extends Node

@onready var fx_player: AudioStreamPlayer = $FxAudioPlayer
@onready var music_player: AudioStreamPlayer = $MusicAudioPlayer

func _ready() -> void:
	AudioPlayer.on_play_sound.connect(_on_play_sound)


func _on_play_sound(category: String, sound: AudioStream) -> void:
	match category.to_lower():
		"fx":
			# fx_player.stop()
			fx_player.stream = sound
			fx_player.pitch_scale = randf_range(0.9, 1.1)
			# fx_player.volume_db = randf_range(-10, 2.0)
			fx_player.play()
		"music":
			music_player.stop()
			music_player.stream = sound
			music_player.play()
