class_name HitboxComponent
extends Area2D

signal hit(hurtbox: HurtboxComponent)

@export var damage: float = 10.0


func _ready() -> void:
	area_entered.connect(_on_hurtbox_entered)


func _on_hurtbox_entered(hurtbox: HurtboxComponent) -> void:
	hurtbox.take_damage(damage)
	hit.emit(hurtbox)
