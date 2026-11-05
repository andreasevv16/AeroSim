extends MultiMeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var stripe_count: int = 25
	var stripe_spacing: float = 24.0

	multimesh.instance_count = stripe_count

	for i in range(stripe_count):
		var position_z: float = -288.0 + i * stripe_spacing

		var transform := Transform3D.IDENTITY
		transform.origin = Vector3(0.0, 0.07, position_z)

		multimesh.set_instance_transform(i, transform)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
