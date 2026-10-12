extends AnimatedSprite2D

@onready var bar = $AnimatedSprite2D
@export var lives : int = 5
var eye = preload("res://tiles/eye.tscn")
var force : float = 1.0

signal throw

func _physics_process(_delta):
	if Input.is_action_pressed("shoot"):
		bar.play()
		await bar.frame_changed
		bar.pause()
	if Input.is_action_just_released("shoot"):
		shoot()
	if frame == 8:
		throw.emit()

func shoot():
	play("eye_" + str(lives))
	lives -= 1
	if lives == 0:
		lives = 5
	await throw
	var instance = eye.instantiate()
	add_child(instance)
	instance.global_position = get_node("../EyeSpawn").global_position
	instance.reparent(get_parent())
	instance.apply_central_impulse(Vector2(-bar.frame - 1 * 1000, 0))
