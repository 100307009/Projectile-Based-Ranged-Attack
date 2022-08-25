extends Node2D

onready var fireball_template = preload("res://Fireball/Fireball.tscn")
onready var arrow_template = preload("res://Arrow/Arrow.tscn")

export var projectile: PackedScene

enum {FIREBALL, ARROW}

func _process(_delta):
	look_at(get_global_mouse_position())

func _input(event):
	if event.is_action_pressed("Left Click"):
		fire(projectile)
#	if event.is_action_pressed("Left Click"):
#		shoot(ARROW)
#
#	if event.is_action_pressed("Right Click"):
#		shoot(FIREBALL)
		
		
func shoot(type):
	var projectile_instance
	match type:
		ARROW:
			projectile_instance = arrow_template.instance()

		FIREBALL:
			projectile_instance = fireball_template.instance()		
		
	
	
	projectile_instance.position = position
	projectile_instance.direction = (get_global_mouse_position()-position).normalized()
	get_tree().get_root().add_child(projectile_instance)

func fire(projectile):
	var projectile_instance = projectile.instance()
	projectile_instance.position = position
	projectile_instance.direction = (get_global_mouse_position()-position).normalized()
	get_tree().get_root().add_child(projectile_instance)
