class_name HealthComponent
extends Node

signal changed(health: float)
signal healed(amount: float)
signal damaged(amount: float)

@export var max_health: float = 100.0

var health := max_health:
	set(value):
		health = clampf(value, 0.0, max_health)
		changed.emit(health)


func heal(amount: float) -> void:
	health += amount 
	healed.emit(amount)


func damage(amount: float) -> void:
	health -= amount
	damaged.emit(amount)
