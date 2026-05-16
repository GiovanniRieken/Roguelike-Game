extends LimboState

var player: Player


func _setup() -> void:
	player = agent


func _update(delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, 0, player.acceleration * delta)
	player.velocity.z = move_toward(player.velocity.z, 0, player.acceleration * delta)
	
	if player.input_direction != Vector2.ZERO:
		dispatch(EVENT_FINISHED)
