extends CharacterBody2D

const speed = 300.0
const jump_speed = -500.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		$SoundJump.play()
		velocity.y = jump_speed

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction*speed
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play()
	elif direction < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	move_and_slide()
