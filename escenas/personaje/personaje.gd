extends CharacterBody2D

@export var animacion: AnimatedSprite2D

var _velocidad: float = 100.0
var _velocidad_salto: float = -300.0

func _physics_process(delta: float):
	animacion.play("correr")
	
	# gravedad
	velocity += get_gravity() * delta
	
	# salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = _velocidad_salto
	
	# movimiento lateral
	if Input.is_action_pressed("ui_right"):
		velocity.x = _velocidad
		animacion.flip_h = true
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -_velocidad
		animacion.flip_h = false
	else:
		velocity.x = 0
		
	# animacion
	if !is_on_floor():
		animacion.play("saltar")
	elif velocity.x != 0:
		animacion.play("correr")
	else:
		animacion.play("idle")
		
	
	move_and_slide()
	
	
