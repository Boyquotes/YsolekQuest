extends Node

var num_players = 12  # How many AudioStreamPlayers to use
var bus = "master"  # Which bus to play audio on

var available = []  # The list of available players
var queue = []  # The queue of sounds to play
var playing = false




# To play anywhere in your project
# that you want to play a sound, use:
# AudioStreamManager.play("res://path/to/sound")


func _ready():
	# Create the pool of AudioStreamPlayer nodes
	for i in num_players:
		var p = AudioStreamPlayer2D.new()
		p.volume_db = -8
		add_child(p)
		available.append(p)
		#p.get_playback_position()
		p.finished.connect(on_stream_finished.bind(p))
		p.bus = bus
		
		
		
func on_stream_finished(stream):
	# When a stream finishes playing a sound, make it available again
	playing = false
	#if(stream.playing == false):
	available.append(stream)
	

func play(sound_path):
	queue.append(sound_path)
	

func _process(delta):
	# Play a queued sound if any player is available
	if not queue.is_empty() and not available.is_empty():
		available[0].stream = load(queue.pop_front())
		available[0].play()
		available.pop_front()
