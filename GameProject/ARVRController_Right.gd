extends ARVRController


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if(move_type == MOVEMENT_TYPE.MOVE_AND_ROTATE && abs(left_right) > 0.1):
				if smooth_rotation:
					# we rotate around our Camera, but we adjust our origin, so we need a little bit of trickery
					var t1 = Transform()
					var t2 = Transform()
					var rot = Transform()
					
					t1.origin = -camera_node.transform.origin
					t2.origin = camera_node.transform.origin
					rot = rot.rotated(Vector3(0.0, -1.0, 0.0), smooth_turn_speed * delta * left_right)
					origin_node.transform *= t2 * rot * t1
					
					# reset turn step, doesn't apply
					turn_step = 0.0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
