class_name Player
extends CharacterBody3D

@export var speed: float = 5.0
@export var acceleration: float = 100.0
@export var friction: float = 120.0

var input_direction: Vector2 = Vector2.ZERO

@onready var state_machine: LimboHSM = $StateMachine
@onready var idle_state: LimboState = $StateMachine/IdleState
@onready var move_state: LimboState = $StateMachine/MoveState


func _ready() -> void:
	_initialize_state_machine()


func _physics_process(_delta: float) -> void:
	_update_input_direction()
	move_and_slide()


func _initialize_state_machine() -> void:
	state_machine.add_transition(idle_state, move_state, idle_state.EVENT_FINISHED)
	state_machine.add_transition(move_state, idle_state, move_state.EVENT_FINISHED)

	state_machine.initialize(self)
	state_machine.set_active(true)


func _update_input_direction() -> void:
	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
