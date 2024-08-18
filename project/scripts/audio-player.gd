extends Node

signal on_play_sound(category: String, sound: AudioStream)

var _fx_sounds: Dictionary = {
	"random": load("res://sfx/random.wav"),
	"jump": load("res://sfx/jump.wav"),
	"hammer": load("res://sfx/hammer.wav"),
}


func play(category: String, sound_name: String) -> void:
	var sound: AudioStream = null
	match category.to_lower():
		"fx":
			if sound_name in _fx_sounds:
				sound = _fx_sounds[sound_name]
		"music":
			if sound_name in _fx_sounds: # TODO Add music dictionary
				sound = _fx_sounds[sound_name]
	if sound == null:
		print("Error: No sound called '" + sound_name + "' in category '" + category + "'")
		return
	on_play_sound.emit(category, sound)


func set_volume(category: String, volume_db: float) -> void:
	var bus_index = AudioServer.get_bus_index(category)
	if bus_index != -1:
		AudioServer.set_bus_volume_db(bus_index, volume_db)
