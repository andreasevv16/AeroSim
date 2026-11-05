extends Node3D
var udp := PacketPeerUDP.new()
var throttle: float = 0.0
func _ready() -> void:
	udp.set_dest_address("127.0.0.1", 5005)
	print("UDP dest config")
func _process(_delta: float) -> void:
	var pitch = Input.get_axis("pitch_down", "pitch_up")
	var roll = Input.get_axis("roll_left", "roll_right")
	var yaw = Input.get_axis("yaw_left", "yaw_right")
	if Input.is_action_pressed("throttle_up"):
		throttle += 0.25 * _delta
	if Input.is_action_pressed("throttle_down"):
		throttle -= 0.25 * _delta
	throttle = clampf(throttle, 0.0, 1.0)
	if pitch != 0 or roll != 0 or yaw != 0:
		print("Pitch: ", pitch, " | Roll: ", roll, " | Yaw: ", yaw)
	if Input.is_action_just_released("throttle_up") or Input.is_action_just_released("throttle_down"):
		print("Throttle: ", snappedf(throttle * 100.0, 0.1), "%")
	var controls = {
	"pitch": pitch,
	"roll": roll,
	"yaw": yaw,
	"throttle": throttle
}

	if Input.is_action_just_pressed("pitch_up"):
		var message = JSON.stringify(controls)
		udp.put_packet(message.to_utf8_buffer())
