extends Area2D
@onready var manager = %manager


func _on_body_entered(body):
	if(body.name == "CharacterBody2D"):
		queue_free()
		manager.add_point()
