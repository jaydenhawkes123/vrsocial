extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var interface = ARVRServer.find_interface("OpenVR")
	if interface:
		if interface.initialize():
			# turn the main viewport into an ARVR viewport:
			get_viewport().arvr = true
			
			# keep linear color space, not needed with the GLES2 renderer
			get_viewport().keep_3d_linear = true
			
			# turn off v-sync
			OS.vsync_enabled = false

			# put our physics in sync with our expected frame rate:
			Engine.iterations_per_second = 90


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
