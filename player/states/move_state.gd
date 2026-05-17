class_name MoveState
extends LimboState

var player: Player


func _setup() -> void:
	player = agent


func _update(delta: float) -> void:
	if player.input_direction == Vector2.ZERO:
		dispatch(EVENT_FINISHED)
		return

	var input_direction := Vector3(player.input_direction.x, 0, player.input_direction.y)
	var direction := (player.transform.basis * input_direction).normalized()
	var target_velocity := direction * player.speed

	player.velocity.x = move_toward(player.velocity.x, target_velocity.x, player.acceleration * delta)
	player.velocity.z = move_toward(player.velocity.z, target_velocity.z, player.acceleration * delta)
