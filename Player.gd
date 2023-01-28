extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	var boolean = true
	
	if Input.is_action_pressed("move_right"):
		velocity.x = 1
		if boolean:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		$AnimatedSprite.play('Walking')
		
	elif Input.is_action_pressed("move_left"):
		velocity.x = -1
		boolean = false
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play('Walking')
		
	else:
		velocity.x = 0
		$AnimatedSprite.play('Idle')
		
	velocity = velocity * speed
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
