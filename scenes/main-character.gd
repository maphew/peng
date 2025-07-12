extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


@onready var spikes: TileMapLayer = $"../spikes"

@export_category("Stats")
@export var acceleration: float = 5.0
@export var max_speed: float = 500.0
@export var min_speed: float = 1.0



func _ready() -> void:
	pass
	#var hazard_area: Area2D = spikes.get_child("Area2D")
	#hazard_area.connect.body_entered(_on_hazard_collision)


func _physics_process(delta: float) -> void:
	#old_movement(delta)

		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
		# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	if Input.is_action_pressed("mv_right"):
		velocity.x += acceleration
		velocity.x = clampf(velocity.x, min_speed, max_speed)

		print("Current Velocity: ", velocity.x)
	
	
	move_and_slide()



func _on_hazard_collision() -> void:
	print("COLLLISSION!!")
