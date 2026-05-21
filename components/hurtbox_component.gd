class_name HurtboxComponent
extends Area2D

@export var health_component: HealthComponent


func take_damage(amount: float) -> void:
	health_component.damage(amount)
