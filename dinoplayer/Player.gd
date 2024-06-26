extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -1000.0
const GRAVITY = 2600

func _physics_process(delta):
	if GHUD.is_playing == true:
		if is_on_floor():
			if Input.is_action_just_pressed("ui_down"):
				$AnimatedSprite2D.play("crouch")
			else:
				$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("jump")
			if Input.is_action_just_pressed("ui_accept") and is_on_floor():
				$AudioJump.play()
				velocity.y = JUMP_VELOCITY
		velocity.y += GRAVITY * delta
		move_and_slide()
