extends CharacterBody2D

signal hit

@onready var sprite := $Sprite2D
var speed = 750

func _ready():
	hit.connect(get_node("/root/Control/Label").update)

func _physics_process(_delta):
	var collision = move_and_collide(Vector2.ZERO)

	if collision:
		hit.emit()
		play_anim()

func play_anim():
	sprite.play()
	await get_tree().create_timer(0.4).timeout
	sprite.pause()
	sprite.set_frame(0)
